#! /bin/bash

set -euo pipefail

sudo hostnamectl set-hostname briands-cachyos-vm

mkdir -p -m 700 ~/.ssh
ln -sf ~/dev/iac/hosts/briands-cachyos-vm/authorized_keys ~/.ssh/authorized_keys

# sshd uses the first value it reads, so this must sort before 99-archlinux.conf
echo "PasswordAuthentication no" | sudo tee /etc/ssh/sshd_config.d/10-no-password.conf >/dev/null
sudo sshd -t
sudo systemctl reload sshd

[ -d ~/dev/my-data ] || git clone git@github.com:briandipalma/my-data.git ~/dev/my-data

mkdir -p ~/.local/share/fish
ln -sf ~/dev/my-data/briands-cachyos-vm/fish_history ~/.local/share/fish/fish_history

sudo pacman -Syu --needed --noconfirm chromium git-delta glab jdk17-openjdk lazygit lsd neovim nodejs-lts-krypton npm starship trash-cli tree-sitter-cli yazi zoxide

sudo npm install -g pnpm@10.28.0

if ! command -v netbird >/dev/null; then
	curl -fsSL https://pkgs.netbird.io/install.sh | sh
fi

# Installs to ~/.local/bin, which may not be on PATH yet in this shell
if ! command -v claude >/dev/null && [ ! -x ~/.local/bin/claude ]; then
	curl -fsSL https://claude.ai/install.sh | bash
fi

echo "Log in to NetBird, Claude and glab"
