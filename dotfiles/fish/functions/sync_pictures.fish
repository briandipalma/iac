function sync_pictures
    rclone sync --checksum --metadata --progress ~/Sync/pictures/ --delete-excluded --exclude="/.stfolder/**" --exclude="/backups/**" --exclude="/encoded-video/**" --exclude="/old/**" --exclude="/profile/**" --exclude="/upload/**" b2:dipalma-pictures
end
