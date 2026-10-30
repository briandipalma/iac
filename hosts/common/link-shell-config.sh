#! /bin/bash

printf '\nLinking shell config\n'

mkdir -p -m 700 ~/.ssh # Doesn't exist in fresh install
mkdir -p ~/.local
mkdir -p ~/.config/herdr

ln -sfn ~/dev/iac/dotfiles/bat ~/.config/bat
rm -rf ~/.config/fish
ln -sfn ~/dev/iac/dotfiles/fish ~/.config/fish
ln -sfn ~/dev/iac/dotfiles/git ~/.config/git
ln -sf ~/dev/iac/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
ln -sfn ~/dev/iac/dotfiles/lazygit ~/.config/lazygit
ln -sfn ~/dev/iac/dotfiles/lsd ~/.config/lsd
ln -sfn ~/dev/iac/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dev/iac/dotfiles/opencode ~/.config/opencode
ln -sf ~/dev/iac/dotfiles/starship.toml ~/.config/

ln -sfn ~/dev/iac/dotfiles/.gemini ~/.gemini
ln -sfn ~/dev/iac/dotfiles/.pi ~/.pi
ln -sf ~/dev/iac/dotfiles/ssh/config ~/.ssh/config
ln -sfn ~/dev/iac/dotfiles/bin ~/.local/bin
