mkdir -p ~/.config/systemd/user

ln -sf backup.service ~/.config/systemd/user/backup.service
ln -sf backup.timer ~/.config/systemd/user/backup.timer

systemctl --user daemon-reload
systemctl --user enable --now backup.timer
