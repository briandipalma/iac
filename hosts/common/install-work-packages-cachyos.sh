#! /bin/bash

printf '\nInstalling work packages from AUR\n'

shelly install aur --needed netbird
sudo systemctl enable --now netbird@main
