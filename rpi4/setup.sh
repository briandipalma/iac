#! /bin/bash

ln -sf ~/iac/rpi4/authorized_keys ~/.ssh/authorized_keys

git config --local credential.helper "store --file .git-credentials"
git config --global user.email "1597820+briandipalma@users.noreply.github.com"
git config --global user.name "Brian Di Palma"

hostnamectl hostname rpi4.test

mkdir -p /mnt/storage
sudo chown data:data /mnt/storage/
mkdir -p /mnt/storage/appdata
