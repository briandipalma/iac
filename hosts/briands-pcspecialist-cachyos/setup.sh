#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

printf '\nSetting hostname\n'

sudo hostnamectl set-hostname briands-pcspecialist-cachyos

# Common setup steps

source ~/dev/iac/hosts/common/link-shell-config.sh
source ~/dev/iac/hosts/common/link-gui-config.sh
source ~/dev/iac/hosts/common/link-autostart-config.sh
source ~/dev/iac/hosts/common/link-my-data.sh
source ~/dev/iac/hosts/common/install-cli-packages-cachyos.sh
source ~/dev/iac/hosts/common/install-gui-packages-cachyos.sh
source ~/dev/iac/hosts/common/install-work-packages-cachyos.sh
source ~/dev/iac/hosts/common/install-gui-packages-flatpak.sh

# Host unique setup steps, can only run after common steps

ln -sf ~/dev/iac/dotfiles/kitty/work-session.conf ~/.config/kitty/host-session.conf

printf '\nInstalling workstation GUI programs\n'

# Fleet tray app, the orbit agent comes from the Fleet server
shelly install aur --needed --no-confirm fleet-desktop
flatpak install -y flathub com.slack.Slack
# utility to manage AppImages, for Vial (keyboard configuration)
flatpak install -y flathub it.mijorus.gearlever

printf '\nLog in to NetBird\n'
printf 'Install the Fleet agent (orbit) package from the Fleet server to enroll this machine\n'
