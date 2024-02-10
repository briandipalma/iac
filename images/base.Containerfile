FROM docker.io/library/archlinux:latest

RUN pacman --sync --refresh

# Install all the packages distrobox installs on init to speed up first enter
RUN pacman -S --noconfirm bash \
			bash-completion \
			bc \
			curl \
			diffutils \
			findutils \
			glibc \
			gnupg \
			inetutils \
			keyutils \
			less \
			lsof \
			man-db \
			man-pages \ \
			mlocate \
			mtr \
			ncurses \
			nss-mdns \
			openssh \
			pigz \
			pinentry \
			procps-ng \
			rsync \
			shadow \
			sudo \
			tcpdump \
			time \
			traceroute \
			tree \
			tzdata \
			unzip \
			util-linux \
			util-linux-libs \
			vte-common \
			wget \
			words \
			xorg-xauth \
			zip \
			mesa \
			opengl-driver \
			vulkan-intel \
			vte-common \
			vulkan-radeon

# Link to host programs
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/flatpak

# Create required locales
RUN sed -i 's/#en_IE.UTF-8/en_IE.UTF-8/' /etc/locale.gen
RUN locale-gen
