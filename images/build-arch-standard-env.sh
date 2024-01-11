#!/usr/bin/env bash

image=$(buildah from docker.io/library/archlinux:latest)

# Upgrade
buildah run "$image" -- pacman -Syu --noconfirm

# Common CLI tools
buildah run "$image" -- pacman -S --noconfirm bat
buildah run "$image" -- pacman -S --noconfirm bottom
buildah run "$image" -- pacman -S --noconfirm direnv
buildah run "$image" -- pacman -S --noconfirm dust
buildah run "$image" -- pacman -S --noconfirm fd
buildah run "$image" -- pacman -S --noconfirm fish
buildah run "$image" -- pacman -S --noconfirm fzf
buildah run "$image" -- pacman -S --noconfirm git
buildah run "$image" -- pacman -S --noconfirm git-delta
buildah run "$image" -- pacman -S --noconfirm lazygit
buildah run "$image" -- pacman -S --noconfirm lsd
buildah run "$image" -- pacman -S --noconfirm neovim
buildah run "$image" -- pacman -S --noconfirm ripgrep
buildah run "$image" -- pacman -S --noconfirm starship
buildah run "$image" -- pacman -S --noconfirm tealdeer
buildah run "$image" -- pacman -S --noconfirm ttf-jetbrains-mono

buildah run "$image" -- pacman -S --noconfirm jdk11-openjdk
buildah run "$image" -- pacman -S --noconfirm nodejs-lts-hydrogen
buildah run "$image" -- pacman -S --noconfirm pnpm

buildah run "$image" -- pacman -S --noconfirm chromium
# Required by karma chrome launcher
buildah config --env CHROME_BIN=/usr/sbin/chromium "$image"

buildah commit "$image" briandipalma/arch-env
