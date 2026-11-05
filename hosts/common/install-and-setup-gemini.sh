#! /bin/bash

if ! pacman -Q gemini-cli &>/dev/null; then
	sudo pacman -S --needed --noconfirm gemini-cli
fi

mkdir -p ~/.gemini
ln -sfn ~/dev/iac/dotfiles/.gemini/trustedFolders.json ~/.gemini/trustedFolders.json
