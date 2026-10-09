#! /bin/bash

ln -sf ~/iac/hosts/rpi4/authorized_keys ~/.ssh/authorized_keys

hostnamectl hostname rpi4.test

mkdir -p /mnt/storage
sudo chown data:data /mnt/storage/
mkdir -p /mnt/storage/appdata
