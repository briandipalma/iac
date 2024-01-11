#!/usr/bin/env bash

image=$(buildah from docker.io/library/archlinux:latest)

buildah run "$image" -- pacman -Syu --noconfirm

buildah run "$image" -- pacman -S --noconfirm bat
buildah run "$image" -- pacman -S --noconfirm direnv
buildah run "$image" -- pacman -S --noconfirm fd
buildah run "$image" -- pacman -S --noconfirm git
buildah run "$image" -- pacman -S --noconfirm lsd
buildah run "$image" -- pacman -S --noconfirm ripgrep

buildah run "$image" -- pacman -S --noconfirm jdk11-openjdk
buildah run "$image" -- pacman -S --noconfirm nodejs-lts-hydrogen
buildah run "$image" -- pacman -S --noconfirm pnpm
buildah run "$image" -- pacman -S --noconfirm chromium

buildah run "$image" -- pacman -S --noconfirm neovim

buildah commit "$image" briandipalma/arch-env
