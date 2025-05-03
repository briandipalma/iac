#! /bin/bash

source inventory.sh

# Common configuration

ln -sf ~/dev/iac/dotfiles/bat ~/.config/
ln -sf ~/dev/iac/dotfiles/bottom ~/.config/
rm -rf ~/.config/cosmic
ln -sf ~/dev/iac/dotfiles/cosmic ~/.config/
ln -sf ~/dev/iac/dotfiles/devilspie2 ~/.config/
ln -sf ~/dev/iac/dotfiles/fish ~/.config/
ln -sf ~/dev/iac/dotfiles/git ~/.config/
ln -sf ~/dev/iac/dotfiles/lazygit ~/.config/
ln -sf ~/dev/iac/dotfiles/lsd ~/.config/
ln -sf ~/dev/iac/dotfiles/nvim ~/.config/
ln -sf ~/dev/iac/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dev/iac/dotfiles/starship.toml ~/.config/
ln -sf ~/dev/iac/dotfiles/wezterm ~/.config/
ln -sf ~/dev/iac/dotfiles/yakuakerc ~/.config/

# Host specific configuration

if [ -d ~/dev/iac/dotfiles/$HOSTNAME/autostart/ ]; then
  ln -sf ~/dev/iac/dotfiles/$HOSTNAME/autostart ~/.config/
fi

if [ -f ~/dev/my-data/$HOSTNAME/fish_history ]; then
  mkdir -p ~/.local/share/fish
  ln -sf ~/dev/my-data/$HOSTNAME/fish_history ~/.local/share/fish/fish_history
fi

if [ -d ~/dev/my-data/$HOSTNAME/syncthing/ ]; then
  mkdir -p ~/.var/app/com.github.zocker_160.SyncThingy/config
  ln -sf ~/dev/my-data/$HOSTNAME/syncthing ~/.var/app/com.github.zocker_160.SyncThingy/config/
fi

if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  mkdir -p ~/.config/rclone
  ln -sf ~/dev/my-data/rclone.conf ~/.config/rclone/rclone.conf
fi
