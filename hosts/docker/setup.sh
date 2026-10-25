#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

printf '\nSetting hostname\n'

sudo hostnamectl set-hostname docker

source ~/dev/iac/hosts/common/setup-ssh.sh docker
