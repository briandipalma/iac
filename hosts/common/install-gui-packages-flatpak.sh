#! /bin/bash

printf '\nInstalling GUI packages from Flathub\n'

# Control flatpak permissions
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.google.Chrome
# Image viewer
flatpak install -y flathub org.kde.koko
# PDF viewer
flatpak install -y flathub org.kde.okular
# Play video files
flatpak install -y flathub info.smplayer.SMPlayer
# Record desktop/webcam audio/video
flatpak install -y flathub com.obsproject.Studio
# Remote desktop access
flatpak install -y flathub org.remmina.Remmina
