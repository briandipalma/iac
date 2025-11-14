#! /bin/bash

source inventory.sh

podman image pull docker.io/briandipalma/base:latest
distrobox assemble create --file ./base.ini

if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  podman image pull docker.io/briandipalma/admin:latest
  distrobox assemble create --file ./admin.ini
fi

if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  podman image pull docker.io/briandipalma/work:latest
  distrobox assemble create --file ./work.ini
fi
