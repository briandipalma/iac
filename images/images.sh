#! /bin/bash

podman image pull docker.io/briandipalma/base:latest
distrobox assemble create --file ./base.ini

podman image pull docker.io/briandipalma/work:latest
distrobox assemble create --file ./work.ini
