#! /bin/bash

# Dotfiles

ln -sf ~/dev/iac/dotfiles/bat/ ~/.config/
ln -sf ~/dev/iac/dotfiles/bottom/ ~/.config/
ln -sf ~/dev/iac/dotfiles/fish/ ~/.config/
ln -sf ~/dev/iac/dotfiles/git/ ~/.config/
ln -sf ~/dev/iac/dotfiles/kitty/ ~/.config/
ln -sf ~/dev/iac/dotfiles/lazygit/ ~/.config/
ln -sf ~/dev/iac/dotfiles/lsd/ ~/.config/
ln -sf ~/dev/iac/dotfiles/nvim/ ~/.config/
ln -sf ~/dev/iac/dotfiles/starship.toml ~/.config/

HOSTNAME=$(hostname)

if [ -f ~/dev/iac/dotfiles/kitty/${HOSTNAME}.conf ]; then
	echo "Linking kitty host config file for $HOSTNAME."
	ln -sf ~/dev/iac/dotfiles/kitty/${HOSTNAME}.conf ~/.config/kitty/host-config.conf
else
	echo "Kitty host config file for $HOSTNAME does *not* exist, linking personal config."
	ln -sf ~/dev/iac/dotfiles/kitty/personal.startup.conf ~/.config/kitty/host-config.conf
fi

# Container tools

ln -sf /usr/bin/distrobox-host-exec ~/.local/bin/podman
