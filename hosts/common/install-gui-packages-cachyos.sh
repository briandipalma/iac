#! /bin/bash

printf '\nInstalling GUI packages from CachyOS repos and AUR\n'

# Needed by the flatpak installs
sudo pacman -S --needed --noconfirm flatpak
# Main terminal
sudo pacman -S --needed --noconfirm kitty
# Launcher
shelly install aur --needed --no-confirm vicinae-bin
# zoom utility
shelly install aur --needed --no-confirm wooz
# Day/night gamma adjustments for Wayland compositors
sudo pacman -S --needed --noconfirm wlsunset
# Grab screenshots of screen area and annotate them
sudo pacman -S --needed --noconfirm slurp grim satty
