FROM docker.io/library/archlinux:latest

RUN pacman -Syuq --noconfirm

RUN pacman -Sq --noconfirm bat bottom dust fd fish fzf 
RUN pacman -Sq --noconfirm git git-delta lazygit
RUN pacman -Sq --noconfirm lsd neovim ripgrep starship 
RUN pacman -Sq --noconfirm tealdeer ttf-jetbrains-mono
# To allow copy/paste to/from host clipboard
RUN pacman -Sq --noconfirm xsel

RUN pacman -Sq --noconfirm jdk11-openjdk nodejs-lts-iron 
RUN pacman -Sq --noconfirm pnpm chromium
# Required by karma chrome launcher
ENV CHROME_BIN=/usr/sbin/chromium
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
