#! /bin/bash

printf '\nInstalling GUI packages from CachyOS repos and AUR\n'

# Needed by the flatpak installs
sudo pacman -S --needed --noconfirm flatpak
# Main terminal
paru -S --needed --noconfirm kitty
# Launcher
paru -S --needed --noconfirm vicinae-bin
# zoom utility
paru -S --needed --noconfirm wooz
# Day/night gamma adjustments for Wayland compositors
paru -S --needed --noconfirm wlsunset
# Grab screenshots of screen area and annotate them
paru -S --needed --noconfirm slurp grim satty
