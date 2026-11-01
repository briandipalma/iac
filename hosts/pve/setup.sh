#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

ln -sf ~/dev/iac/dotfiles/bash/bash_aliases.bash ~/.bash_aliases
ln -sf ~/dev/iac/hosts/pve/bash_local.bash ~/.bash_local.bash
ln -sfn ~/dev/iac/dotfiles/git ~/.config/git

source ~/dev/iac/hosts/common/setup-ssh.sh pve
