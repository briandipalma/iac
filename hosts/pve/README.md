# PVE

Proxmox setup configuration

`fstab` is the `/etc/fstab` file.
`100.conf` goes in `/etc/pve/lxc/100.conf`
`create-work-vm.sh` creates the `work` QEMU VM from the CachyOS ISO, sized from
the host's CPU topology and RAM minus 4 GB.
