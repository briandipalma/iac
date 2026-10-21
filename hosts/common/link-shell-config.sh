#! /bin/bash

printf '\nLinking shell config\n'

mkdir -p -m 700 ~/.ssh # Doesn't exist in fresh install
mkdir -p ~/.local
mkdir -p ~/.config/herdr

ln -sf ~/dev/iac/dotfiles/bat ~/.config/
rm -rf ~/.config/fish
ln -sf ~/dev/iac/dotfiles/fish ~/.config/
ln -sf ~/dev/iac/dotfiles/git ~/.config/
ln -sf ~/dev/iac/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
ln -sf ~/dev/iac/dotfiles/lazygit ~/.config/
ln -sf ~/dev/iac/dotfiles/lsd ~/.config/
ln -sf ~/dev/iac/dotfiles/nvim ~/.config/
ln -sf ~/dev/iac/dotfiles/opencode ~/.config/
ln -sf ~/dev/iac/dotfiles/starship.toml ~/.config/

ln -sf ~/dev/iac/dotfiles/.gemini ~/
ln -sf ~/dev/iac/dotfiles/.pi ~/
ln -sf ~/dev/iac/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dev/iac/dotfiles/bin ~/.local/
