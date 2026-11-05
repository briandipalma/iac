#! /bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <program> [config]" >&2
	echo "  config: file or directory in dotfiles to link into ~/.config (defaults to <program>)" >&2
	exit 1
fi

program="$1"
config="${2:-$program}"

echo "Installing and setting up config for $program"

if ! pacman -Q "$program" &>/dev/null; then
	sudo pacman -S --needed --noconfirm "$program"
fi

target=~/.config/"$config"

if [ -e "$target" ] && [ ! -L "$target" ]; then
	backup="$target-backup"
	if [ -e "$backup" ]; then
		echo "Cannot back up $target: $backup already exists" >&2
		exit 1
	fi
	echo "Moving existing $target to $backup"
	mv "$target" "$backup"
fi

ln -sfn ~/dev/iac/dotfiles/"$config" "$target"
