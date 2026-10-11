#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

sudo hostnamectl set-hostname brians-infinitybookpro14-cachyos

# Common setup steps

source ~/dev/iac/hosts/common/link-shell-config.sh
source ~/dev/iac/hosts/common/link-gui-config.sh
source ~/dev/iac/hosts/common/link-autostart-config.sh
source ~/dev/iac/hosts/common/link-my-data.sh
source ~/dev/iac/hosts/common/install-cli-packages-cachyos.sh
source ~/dev/iac/hosts/common/install-gui-packages-cachyos.sh
source ~/dev/iac/hosts/common/install-gui-packages-flatpak.sh

# Host unique setup steps, can only run after common steps

if [ -d ~/dev/my-data/brians-infinitybookpro14-cachyos/syncthing/ ]; then
  mkdir -p ~/.var/app/com.github.zocker_160.SyncThingy/config
  ln -sf ~/dev/my-data/brians-infinitybookpro14-cachyos/syncthing ~/.var/app/com.github.zocker_160.SyncThingy/config/
fi

mkdir -p ~/.config/rclone
ln -sf ~/dev/my-data/rclone.conf ~/.config/rclone/rclone.conf

ln -sf ~/dev/iac/dotfiles/kitty/personal-session.conf ~/.config/kitty/host-session.conf

flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.dropbox.Client
flatpak install -y flathub com.github.zocker_160.SyncThingy
flatpak install -y flathub com.heroicgameslauncher.hgl
flatpak install -y flathub org.darktable.Darktable
flatpak install -y flathub org.kde.digikam
flatpak install -y flathub org.kde.skanpage
flatpak install -y flathub org.mozilla.Thunderbird
flatpak install -y flathub org.musicbrainz.Picard
flatpak install -y flathub org.nicotine_plus.Nicotine
flatpak install -y flathub org.strawberrymusicplayer.strawberry

paru -S --needed --noconfirm winbox
paru -S --needed --noconfirm kanata-bin
source ~/dev/iac/hosts/brians-infinitybookpro14-cachyos/kanata.sh
# Network driver
paru -S --needed --noconfirm yt6801-dkms
