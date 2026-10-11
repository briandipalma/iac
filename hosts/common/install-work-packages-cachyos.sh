#! /bin/bash

printf '\nInstalling work packages from AUR\n'

paru -S --needed --noconfirm netbird
sudo systemctl enable --now netbird@main
