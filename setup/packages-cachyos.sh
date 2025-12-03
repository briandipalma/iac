#! /bin/bash

source inventory.sh

# Main terminal
sudo pacman -S kitty
# AUR helper
sudo pacman -S yay

##
## Personal workstations
##
if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  yay -S winbox
  sudo pacman -S wireguard-tools

  if [ -d ~/wireguard/ ]; then
    echo "Moving WireGuard config, invoking sudo"
    sudo mv ~/wireguard /etc/
    sudo chown -R root /etc/wireguard
    sudo chgrp -R root /etc/wireguard
    # Remove any group or others permissions, only owner (root) is able to read files
    sudo chmod go= /etc/wireguard/private.key
    sudo chmod go= /etc/wireguard/wg0.conf
  fi
fi

##
## Work workstations
##
if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  yay -S netbird
  yay -S fleet-desktop
fi

if [[ $HOSTNAME =~ "infinitybookpro14" ]]; then
  yay -S yt6801-dkms
fi
