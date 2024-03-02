#! /bin/bash

source inventory.sh

flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.google.Chrome
flatpak install -y flathub io.github.seadve.Kooha
flatpak install -y flathub org.remmina.Remmina
flatpak install -y flathub org.virt_manager.virt-viewer
flatpak install -y flathub org.wezfurlong.wezterm

if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
	flatpak install -y flathub com.slack.Slack
fi

if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
	flatpak install -y flathub com.dropbox.Client
	flatpak install -y flathub com.github.taiko2k.tauonmb
	flatpak install -y flathub com.github.zocker_160.SyncThingy
	flatpak install -y flathub com.heroicgameslauncher.hgl
	flatpak install -y flathub com.valvesoftware.Steam
	flatpak install -y flathub org.darktable.Darktable
	flatpak install -y flathub org.kde.digikam
	flatpak install -y flathub org.mozilla.Thunderbird
	sudo apt install wireguard
fi
