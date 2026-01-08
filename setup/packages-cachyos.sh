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
