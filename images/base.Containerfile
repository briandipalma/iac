FROM docker.io/library/archlinux:latest

RUN pacman --sync --refresh

# Link to host programs
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/flatpak

# Create required locales
RUN sed -i 's/#en_IE.UTF-8/en_IE.UTF-8/' /etc/locale.gen
RUN locale-gen
