FROM docker.io/library/archlinux:latest

RUN pacman -Syuq --noconfirm

# CLI utilities
RUN pacman -Sq --noconfirm ansible
RUN pacman -Sq --noconfirm bat bottom dust fd fish fzf 
RUN pacman -Sq --noconfirm git git-delta lazygit
RUN pacman -Sq --noconfirm lsd neovim ripgrep starship 
RUN pacman -Sq --noconfirm tealdeer terraform
# Safer rm
RUN pacman -Sq --noconfirm trash-cli

# Complile nvim treesitter
RUN pacman -Sq --noconfirm gcc
# Complile telescope-fzf-native
RUN pacman -Sq --noconfirm make

# To allow copy/paste to/from host clipboard
RUN pacman -Sq --noconfirm xsel

# Export from container
RUN pacman -Sq --noconfirm kitty
RUN pacman -Sq --noconfirm ttf-jetbrains-mono

# Web app development
RUN pacman -Sq --noconfirm nodejs-lts-iron 
RUN pacman -Sq --noconfirm pnpm chromium

# Required by mason.nvim
RUN pacman -Sq --noconfirm npm

# Required by karma chrome launcher
ENV CHROME_BIN=/usr/sbin/chromium

# Java development tooling - jdtls
RUN pacman -Sq --noconfirm jdk21-openjdk
# Web app and backend development
RUN pacman -Sq --noconfirm jdk11-openjdk

# Link to host programs
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/flatpak

# Create required locales
RUN sed -i 's/#en_IE.UTF-8/en_IE.UTF-8/' /etc/locale.gen
RUN locale-gen

# Web app servers and backend development
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
