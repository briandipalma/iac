#! /bin/bash

source inventory.sh

DEV_DIR=$HOME/dev

if [ ! -d $DEV_DIR/my-data ]; then
  git clone git@github.com:briandipalma/my-data.git $DEV_DIR/my-data
fi

if [[ ! -d $DEV_DIR/proxmox-services && ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  git clone git@github.com:briandipalma/proxmox-services.git $DEV_DIR/proxmox-services
fi
