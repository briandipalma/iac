#! /bin/bash

printf '\nLinking GUI config\n'

ln -sf ~/dev/iac/dotfiles/kitty ~/.config/
ln -sf ~/dev/iac/dotfiles/mimeapps.list ~/.config/
rm -rf ~/.config/niri
ln -sf ~/dev/iac/dotfiles/niri ~/.config/
rm -rf ~/.config/noctalia
ln -sf ~/dev/iac/dotfiles/noctalia ~/.config/
ln -sf ~/dev/iac/dotfiles/satty ~/.config/
