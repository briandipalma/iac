#! /bin/bash

source inventory.sh

# Main terminal
flatpak install -y flathub org.wezfurlong.wezterm

sudo apt-get update
# Order programs onto workspaces in X11
sudo apt -y install devilspie2
# Drop down terminal for host
sudo apt -y install yakuake
# To easily install Linux/Windows/macOS VMs
sudo apt-add-repository ppa:flexiondotorg/quickemu
sudo apt update
sudo apt install quickemu

##
## Personal workstations
##
if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
  flatpak install -y flathub net.davidotek.pupgui2
  flatpak install -y flathub com.heroicgameslauncher.hgl
  flatpak install -y flathub com.valvesoftware.Steam
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

##
## Work workstations
##
if [[ ! -e /usr/share/keyrings/netbird-archive-keyring.gpg && ${workWorkstations[@]} =~ $HOSTNAME ]]; then
  sudo apt-get install ca-certificates curl gnupg -y
  curl -sSL https://pkgs.netbird.io/debian/public.key | sudo gpg --dearmor --output /usr/share/keyrings/netbird-archive-keyring.gpg
  echo 'deb [signed-by=/usr/share/keyrings/netbird-archive-keyring.gpg] https://pkgs.netbird.io/debian stable main' | sudo tee /etc/apt/sources.list.d/netbird.list

  sudo apt-get update

  # for CLI only
  sudo apt-get install netbird
  # for GUI package
  sudo apt-get install netbird-ui
fi
