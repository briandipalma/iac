#! /bin/bash

sudo groupadd --system uinput
sudo useradd --system --no-create-home --shell /bin/false -g uinput -G input kanata

sudo cp ~/dev/iac/dotfiles/udev/60-uinput.rules /lib/udev/rules.d/
sudo cp ~/dev/iac/dotfiles/kanata/kanata.kbd /etc/kanata.kbd
sudo cp ~/dev/iac/dotfiles/systemd/kanata.service /etc/systemd/system

sudo systemctl start kanata
sudo systemctl enable kanata
