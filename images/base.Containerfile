FROM docker.io/library/archlinux:latest

RUN pacman --sync --refresh

# CLI utilities
RUN pacman -Sq --noconfirm bat bottom dust fd fish fzf 
RUN pacman -Sq --noconfirm git git-delta lazygit
RUN pacman -Sq --noconfirm lsd neovim ripgrep starship 
RUN pacman -Sq --noconfirm tealdeer
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

# Link to host programs
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/flatpak

# Create required locales
RUN sed -i 's/#en_IE.UTF-8/en_IE.UTF-8/' /etc/locale.gen
RUN locale-gen
