#! /bin/bash

source inventory.sh

# Control flatpak permissions
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.google.Chrome
# Play video files
flatpak install -y flathub info.smplayer.SMPlayer
# Play audio files
flatpak install -y flathub com.github.taiko2k.tauonmb
# Record desktop/webcam audio/video
flatpak install -y flathub com.obsproject.Studio
# Remote desktop access
flatpak install -y flathub org.remmina.Remmina
flatpak install -y flathub org.virt_manager.virt-viewer
# Main terminal
flatpak install -y flathub org.wezfurlong.wezterm
# Graphics/screenshot editor
flatpak install -y flathub org.kde.krita
# Order programs onto workspaces in X11
sudo apt -y install devilspie2
# Drop down terminal for host
sudo apt -y install yakuake

# File type handling
xdg-mime default info.smplayer.SMPlayer.desktop video/mp4
xdg-mime default info.smplayer.SMPlayer.desktop video/x-matroska
xdg-mime default info.smplayer.SMPlayer.desktop video/vnd.avi
xdg-mime default info.smplayer.SMPlayer.desktop video/mp2t
xdg-mime default com.github.taiko2k.tauonmb.desktop audio/flac

if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  flatpak install -y flathub com.slack.Slack
fi

if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  flatpak install -y flathub com.discordapp.Discord
  flatpak install -y flathub com.dropbox.Client
  flatpak install -y flathub com.github.zocker_160.SyncThingy
  flatpak install -y flathub com.heroicgameslauncher.hgl
  flatpak install -y flathub com.valvesoftware.Steam
  flatpak install -y flathub org.darktable.Darktable
  flatpak install -y flathub org.kde.digikam
  flatpak install -y flathub org.mozilla.Thunderbird
  sudo apt -y install wireguard

  if [ -d ~/wireguard/ ]; then
    echo "Moving WireGuard config, invoking sudo"
    sudo mv ~/wireguard /etc/
    sudo chown -R root /etc/wireguard
    sudo chgrp -R root /etc/wireguard
    # Remove any group or others permissions, only owner (root) is able to read files
    sudo chmod go= /etc/wireguard/private.key
    sudo chmod go= /etc/wireguard/wg0.conf
  fi
fi

if [[ ! -e /usr/bin/kanata && ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  sudo curl --location --output /usr/bin/kanata https://github.com/jtroo/kanata/releases/download/v1.8.0/kanata
  sudo chmod +x /usr/bin/kanata

  sudo groupadd uinput
  sudo useradd -g uinput -G input kanata

  sudo cp ~/dev/iac/dotfiles/udev/60-uinput.rules /lib/udev/rules.d/
  sudo cp ~/dev/iac/dotfiles/kanata/kanata.kbd /etc/kanata.kbd

  sudo cp ~/dev/iac/dotfiles/systemd/kanata.service /etc/systemd/system
  sudo systemctl start kanata
  sudo systemctl enable kanata
fi

# To easily install Linux/Windows/macOS VMs
sudo apt-add-repository ppa:flexiondotorg/quickemu
sudo apt update
sudo apt install quickemu
