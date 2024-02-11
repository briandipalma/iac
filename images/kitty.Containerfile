FROM docker.io/library/archlinux:latest

RUN pacman --sync --refresh

RUN pacman -S --noconfirm kitty libxcursor libcanberra

# Link to host programs
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/distrobox

# Create required locales
RUN sed -i 's/#en_IE.UTF-8/en_IE.UTF-8/' /etc/locale.gen
RUN locale-gen
