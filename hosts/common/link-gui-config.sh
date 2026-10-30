#! /bin/bash

printf '\nLinking GUI config\n'

ln -sfn ~/dev/iac/dotfiles/kitty ~/.config/kitty
ln -sf ~/dev/iac/dotfiles/mimeapps.list ~/.config/
rm -rf ~/.config/niri
ln -sfn ~/dev/iac/dotfiles/niri ~/.config/niri
rm -rf ~/.config/noctalia
ln -sfn ~/dev/iac/dotfiles/noctalia ~/.config/noctalia
ln -sfn ~/dev/iac/dotfiles/satty ~/.config/satty
