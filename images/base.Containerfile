FROM docker.io/archlinux/archlinux:latest

RUN pacman --sync --refresh

# CLI utilities
RUN pacman -Sq --noconfirm bat bottom dust fd fish fzf 
RUN pacman -Sq --noconfirm git git-delta lazygit
RUN pacman -Sq --noconfirm lsd neovim ripgrep starship 
RUN pacman -Sq --noconfirm tealdeer yazi
# Safer rm
RUN pacman -Sq --noconfirm trash-cli

# Complile nvim treesitter
RUN pacman -Sq --noconfirm gcc tree-sitter-cli

# To allow copy/paste to/from host clipboard
RUN pacman -Sq --noconfirm wl-clipboard

# mason.nvim uses npm to update language-servers
RUN pacman -Sq --noconfirm nodejs-lts-iron npm
RUN npm install zx -g
# Used by ltex-plus
RUN pacman -Sq --noconfirm jdk21-openjdk

# Link to host programs
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker

# Create required locales
RUN sed -i 's/#en_IE.UTF-8/en_IE.UTF-8/' /etc/locale.gen
RUN locale-gen
