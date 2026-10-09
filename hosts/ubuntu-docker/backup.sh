#!/bin/sh

set -eu

echo "Backing up pictures"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/data/pictures/ \
  --delete-excluded \
  --exclude=".dtrash/**" \
  --exclude=".immich/**" \
  --exclude=".stfolder/**" \
  --exclude=".stignore" \
  --exclude="encoded-video/**" \
  --exclude="/profile/**" \
  --exclude="thumbs/**" \
  b2_immich:dipalma-pictures

echo "Backing up jellyfin"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/appdata/jellyfin/data/data/backups/ \
  b2_backups:dipalma-docker-backups/pve/jellyfin

echo "Backing up komodo"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/appdata/komodo/backups/ \
  --delete-excluded \
  --exclude="Stats.gz" \
  b2_backups:dipalma-docker-backups/pve/komodo

echo "Backing up pihole"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/appdata/pihole/backups \
  b2_backups:dipalma-docker-backups/pve/pihole

echo "Backing up qBittorrent"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/appdata/qbittorrent/qBittorrent \
  --include="**.json" \
  --include="**.conf" \
  b2_backups:dipalma-docker-backups/pve/qbittorrent

echo "Backing up syncthing"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/appdata/syncthing/config \
  --include="**.xml" \
  --include="**.pem" \
  b2_backups:dipalma-docker-backups/pve/syncthing

echo "Backing up traefik"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/appdata/traefik \
  b2_backups:dipalma-docker-backups/pve/traefik

echo "Backing up wireguard"

rclone sync \
  --checksum \
  --metadata \
  --progress \
  --stats 10000h \
  /mnt/storage/appdata/wireguard/config \
  b2_backups:dipalma-docker-backups/pve/wireguard
