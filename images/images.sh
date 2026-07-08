#! /bin/bash

source ../setup/inventory.sh

podman image pull docker.io/briandipalma/base:latest
distrobox assemble create --file ./base.ini

if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  podman image pull docker.io/briandipalma/work:latest
  distrobox assemble create --file ./work.ini
fi
