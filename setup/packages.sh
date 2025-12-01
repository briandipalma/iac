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
flatpak install -y flathub it.mijorus.gearlever

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

if [[ ! -e /usr/bin/kanata && ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  install_kanata

  sudo groupadd --system uinput
  sudo useradd --system --no-create-home --shell /bin/false -g uinput -G input kanata

  sudo cp ~/dev/iac/dotfiles/udev/60-uinput.rules /lib/udev/rules.d/
  sudo cp ~/dev/iac/dotfiles/kanata/kanata.kbd /etc/kanata.kbd
  sudo cp ~/dev/iac/dotfiles/systemd/kanata.service /etc/systemd/system

  sudo systemctl start kanata
  sudo systemctl enable kanata
elif [[ "$1" == "-kanata" ]]; then
  install_kanata

  sudo systemctl restart kanata
fi

##
## Work workstations
##
if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  flatpak install -y flathub com.slack.Slack
fi

install_kanata() {
  curl --location --output /tmp/kanata.zip https://github.com/jtroo/kanata/releases/download/v1.10.0/linux-binaries-x64-v1.10.0.zip
  unzip /tmp/kanata.zip -d /tmp/
  sudo rm /usr/bin/kanata
  sudo mv /tmp/kanata_linux_x64 /usr/bin/kanata
}
