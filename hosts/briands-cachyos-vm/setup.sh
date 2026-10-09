#! /bin/bash

ln -sf ~/dev/iac/hosts/briands-cachyos-vm/authorized_keys ~/.ssh/authorized_keys

git clone git@github.com:briandipalma/my-data.git $HOME/dev/my-data

pacman -Sq --noconfirm chromium git-delta glab jdk17-openjdk lazygit lsd neovim nodejs-lts-krypton npm starship trash-cli tree-sitter-cli yazi zoxide

npm install -g pnpm@10.28.0

curl -fsSL https://pkgs.netbird.io/install.sh | sh

curl -fsSL https://claude.ai/install.sh | bash

echo "Log in to NetBird, Claude and glab"
