#! /bin/bash

source inventory.sh

# Dotfiles

ln -sf ~/dev/iac/dotfiles/bat/ ~/.config/
ln -sf ~/dev/iac/dotfiles/bottom/ ~/.config/
ln -sf ~/dev/iac/dotfiles/fish/ ~/.config/
ln -sf ~/dev/iac/dotfiles/git/ ~/.config/
ln -sf ~/dev/iac/dotfiles/lazygit/ ~/.config/
ln -sf ~/dev/iac/dotfiles/lsd/ ~/.config/
ln -sf ~/dev/iac/dotfiles/nvim/ ~/.config/
ln -sf ~/dev/iac/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dev/iac/dotfiles/starship.toml ~/.config/
ln -sf ~/dev/iac/dotfiles/wezterm/ ~/.config/

if [ -d ~/dev/iac/dotfiles/$HOSTNAME/autostart/ ]; then
	ln -sf ~/dev/iac/dotfiles/$HOSTNAME/autostart/ ~/.config/
fi

if [ -d ~/dev/my-data/$HOSTNAME/syncthing/ ]; then
	ln -sf ~/dev/my-data/$HOSTNAME/syncthing ~/.var/app/com.github.zocker_160.SyncThingy/config/
fi
