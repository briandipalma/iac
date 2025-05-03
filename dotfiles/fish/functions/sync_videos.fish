function sync_videos
    rclone sync --checksum --metadata --progress ~/Sync/videos/ --delete-excluded --exclude="/.stfolder/**" b2:dipalma-videos
end
