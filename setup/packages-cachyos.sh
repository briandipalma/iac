#! /bin/bash

source inventory.sh

# Main terminal
paru -S kitty
# Launcher
paru -S vicinae-bin
# zoom utility
paru -S wooz

##
## Personal workstations
##
if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  paru -S winbox
  paru -S kanata-bin
  source kanata.sh
fi

##
## Work workstations
##
if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  paru -S netbird
  paru -S fleet-desktop
fi

if [[ $HOSTNAME =~ "infinitybookpro14" ]]; then
  paru -S yt6801-dkms
fi
