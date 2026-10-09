mkdir -p ~/.config/systemd/user

ln -sf ~/iac/hosts/ubuntu-docker/backup.service ~/.config/systemd/user/backup.service
ln -sf ~/iac/hosts/ubuntu-docker/backup.timer ~/.config/systemd/user/backup.timer

systemctl --user daemon-reload
systemctl --user enable --now backup.timer
