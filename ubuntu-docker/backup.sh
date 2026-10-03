#!/bin/sh

set -eu

# Periphery runs as root, so rclone would look for /root/.config/rclone/rclone.conf
# Override by exporting RCLONE_CONFIG.
export RCLONE_CONFIG=${RCLONE_CONFIG:-/home/data/.config/rclone/rclone.conf}

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/data/pictures/ \
  --delete-excluded \
  --exclude="**.dtrash/**" \
  --exclude="**.immich" \
  --exclude="/.stfolder/**" \
  --exclude="/.stignore" \
  --exclude="/encoded-video/**" \
  --exclude="/profile/**" \
  --exclude="/thumbs/**" \
  b2_immich:dipalma-pictures

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/appdata/jellyfin/data/data/backups/ \
  b2_backups:dipalma-docker-backups/pve/jellyfin

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/appdata/komodo/backups/ \
  --delete-excluded \
  --exclude="Stats.gz" \
  b2_backups:dipalma-docker-backups/pve/komodo

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/appdata/pihole/ \
  --include="**.zip" \
  b2_backups:dipalma-docker-backups/pve/pihole

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/appdata/qbittorrent/qBittorrent \
  --include="**.json" \
  --include="**.conf" \
  b2_backups:dipalma-docker-backups/pve/qbittorrent

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/appdata/syncthing/config \
  --include="**.xml" \
  --include="**.pem" \
  b2_backups:dipalma-docker-backups/pve/syncthing

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/appdata/traefik \
  b2_backups:dipalma-docker-backups/pve/traefik

rclone sync \
  --checksum \
  --metadata \
  /mnt/storage/appdata/wireguard/config \
  b2_backups:dipalma-docker-backups/pve/wireguard
