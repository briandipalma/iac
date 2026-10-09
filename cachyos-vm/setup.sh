#! /bin/bash

git clone git@github.com:briandipalma/my-data.git $HOME/dev/my-data

pacman -Sq --noconfirm git-delta lazygit lsd neovim starship trash-cli tree-sitter-cli yazi zoxide

curl -fsSL https://pkgs.netbird.io/install.sh | sh
