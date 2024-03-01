#! /bin/bash

source inventory.sh

# Dotfiles

ln -sf ~/dev/iac/dotfiles/autostart/ ~/.config/
ln -sf ~/dev/iac/dotfiles/bat/ ~/.config/
ln -sf ~/dev/iac/dotfiles/bottom/ ~/.config/
ln -sf ~/dev/iac/dotfiles/fish/ ~/.config/
ln -sf ~/dev/iac/dotfiles/git/ ~/.config/
ln -sf ~/dev/iac/dotfiles/lazygit/ ~/.config/
ln -sf ~/dev/iac/dotfiles/lsd/ ~/.config/
ln -sf ~/dev/iac/dotfiles/nvim/ ~/.config/
ln -sf ~/dev/iac/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dev/iac/dotfiles/starship.toml ~/.config/
ln -sf ~/dev/iac/dotfiles/systemd/ ~/.config/
ln -sf ~/dev/iac/dotfiles/wezterm/ ~/.config/

if [ -d ~/dev/my-data/$HOSTNAME/syncthing/ ]; then
	ln -sf ~/dev/my-data/$HOSTNAME/syncthing/ ~/.local/state/
fi
