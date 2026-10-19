#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

mkdir -p ~/.config
ln -sf ~/dev/iac/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dev/iac/dotfiles/git ~/.config/

[ -d ~/dev/my-data ] || git clone git@github.com:briandipalma/my-data.git ~/dev/my-data
