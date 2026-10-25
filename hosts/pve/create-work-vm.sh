#!/usr/bin/env bash
# Create the "work" QEMU VM on the PVE host from the CachyOS installer ISO.
#
# Run as root on the node. Sizing is derived from the host: all physical
# cores, all sockets, and total RAM minus HOST_RESERVE_MB. No MAC is set
# (PVE generates one) and no guest IP is configured (see note at the end).
set -euo pipefail

# --- fixed settings ---------------------------------------------------------
NAME="${NAME:-work}"
VMID="${VMID:-}"                        # empty = take next free ID
ISO_STORAGE="local"
ISO_NAME="cachyos-desktop-linux-260809.iso"
DISK_STORAGE="local"
DISK_GB=120
BALLOON=2048
BRIDGE="vmbr0"
HOST_RESERVE_MB=4096
# ---------------------------------------------------------------------------

die() { echo "error: $*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "must run as root on the Proxmox node"
command -v lscpu >/dev/null || die "lscpu not found"

# --- derive sizing from the host -------------------------------------------
SOCKETS=$(lscpu -p=SOCKET | grep -v '^#' | sort -u | wc -l)
PHYS_CORES=$(lscpu -p=SOCKET,CORE | grep -v '^#' | sort -u | wc -l)
THREADS=$(nproc)
CORES=$(( PHYS_CORES / SOCKETS ))

MEM_TOTAL_MB=$(awk '/^MemTotal:/ { printf "%d", $2 / 1024 }' /proc/meminfo)
MEMORY=$(( MEM_TOTAL_MB - HOST_RESERVE_MB ))

(( SOCKETS >= 1 ))     || die "could not detect sockets"
(( CORES >= 1 ))       || die "could not detect cores per socket"
(( MEMORY >= BALLOON )) || die "only ${MEM_TOTAL_MB} MB RAM, cannot reserve ${HOST_RESERVE_MB} MB"

if (( CORES * SOCKETS != PHYS_CORES )); then
  echo "warning: ${PHYS_CORES} cores do not divide evenly across ${SOCKETS} sockets" >&2
fi

if [[ -z $VMID ]]; then
  VMID=$(pvesh get /cluster/nextid)
fi
[[ $VMID =~ ^[0-9]+$ ]] || die "VMID must be numeric, got '$VMID'"

if qm status "$VMID" &>/dev/null; then
  die "VMID $VMID already exists"
fi

pvesm list "$ISO_STORAGE" --content iso | grep -qF "$ISO_NAME" \
  || die "ISO $ISO_NAME not found on storage $ISO_STORAGE"

echo "Host:  ${SOCKETS} socket(s), ${PHYS_CORES} physical cores, ${THREADS} threads, ${MEM_TOTAL_MB} MB RAM"
echo "Guest: ${SOCKETS} socket(s) x ${CORES} cores, ${MEMORY} MB RAM, ${DISK_GB} GB disk"

echo "Creating VM $VMID ($NAME) ..."

qm create "$VMID" \
  --name "$NAME" \
  --memory "$MEMORY" \
  --balloon "$BALLOON" \
  --cores "$CORES" \
  --sockets "$SOCKETS" \
  --cpu host \
  --ostype l26 \
  --machine q35 \
  --bios ovmf \
  --efidisk0 "$DISK_STORAGE:0,efitype=4m" \
  --scsihw virtio-scsi-single \
  --scsi0 "$DISK_STORAGE:${DISK_GB},iothread=1,format=qcow2" \
  --ide2 "$ISO_STORAGE:iso/$ISO_NAME,media=cdrom" \
  --net0 "virtio,bridge=$BRIDGE,firewall=1" \
  --boot 'order=scsi0;ide2;net0' \
  --agent enabled=1 \
  --onboot 1

qm start "$VMID"

echo "VM $VMID started; it is now booting the installer."
