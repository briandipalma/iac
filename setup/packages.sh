#! /bin/bash

source inventory.sh

# Control flatpak permissions
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.google.Chrome
# Image viewer
flatpak install -y flathub org.kde.gwenview
# Play video files
flatpak install -y flathub info.smplayer.SMPlayer
# Play audio files
flatpak install -y flathub com.github.taiko2k.tauonmb
# Record desktop/webcam audio/video
flatpak install -y flathub com.obsproject.Studio
# Remote desktop access
flatpak install -y flathub org.remmina.Remmina
flatpak install -y flathub org.virt_manager.virt-viewer
# Graphics/screenshot editor
flatpak install -y flathub org.kde.krita

##
## Personal workstations
##
if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  flatpak install -y flathub com.discordapp.Discord
  flatpak install -y flathub com.dropbox.Client
  flatpak install -y flathub com.github.zocker_160.SyncThingy
  flatpak install -y flathub org.darktable.Darktable
  flatpak install -y flathub org.kde.digikam
  flatpak install -y flathub org.mozilla.Thunderbird
  flatpak install -y flathub org.musicbrainz.Picard
  flatpak install -y flathub org.nicotine_plus.Nicotine
fi

if [[ ! -e /usr/bin/kanata && ${personalWorkstations[@]} =~ $HOSTNAME || "$1" == "-kanata" ]]; then
  sudo rm /usr/bin/kanata
  sudo curl --location --output /usr/bin/kanata https://github.com/jtroo/kanata/releases/download/v1.9.0/kanata
  sudo chmod +x /usr/bin/kanata

  sudo groupadd --system uinput
  sudo useradd -g uinput -G input kanata

  sudo cp ~/dev/iac/dotfiles/udev/60-uinput.rules /lib/udev/rules.d/
  sudo cp ~/dev/iac/dotfiles/kanata/kanata.kbd /etc/kanata.kbd

  sudo cp ~/dev/iac/dotfiles/systemd/kanata.service /etc/systemd/system
  sudo systemctl start kanata
  sudo systemctl enable kanata
fi

##
## Work workstations
##
if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  flatpak install -y flathub com.slack.Slack
fi
