#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

sudo hostnamectl set-hostname rpi4

source ~/dev/iac/hosts/common/setup-ssh.sh rpi4

mkdir -p /mnt/storage
sudo chown data:data /mnt/storage/
mkdir -p /mnt/storage/appdata
