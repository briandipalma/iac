#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

# Termux doesn't create .config
mkdir -p ~/.config

ln -sf ~/dev/iac/dotfiles/ssh/config ~/.ssh/config
ln -sfn ~/dev/iac/dotfiles/git ~/.config/git

# Termux doesn't ship a user .bashrc
ln -sf ~/dev/iac/hosts/brians-xiaomi15/bashrc.bash ~/.bashrc
ln -sf ~/dev/iac/dotfiles/bash/bash_aliases.bash ~/.bash_aliases

# App don't have access to Termux home directory
[ -d ~/storage/downloads/my-data ] || git clone git@github.com:briandipalma/my-data.git ~/storage/downloads/my-data
