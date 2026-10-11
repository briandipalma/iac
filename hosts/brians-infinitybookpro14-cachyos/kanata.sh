#! /bin/bash

sudo groupadd --force --system uinput
id kanata &>/dev/null || sudo useradd --system --no-create-home --shell /bin/false -g uinput -G input kanata

sudo cp ~/dev/iac/hosts/brians-infinitybookpro14-cachyos/kanata/60-uinput.rules /lib/udev/rules.d/
sudo cp ~/dev/iac/hosts/brians-infinitybookpro14-cachyos/kanata/kanata.kbd /etc/kanata.kbd
sudo cp ~/dev/iac/hosts/brians-infinitybookpro14-cachyos/kanata/kanata.service /etc/systemd/system

sudo systemctl daemon-reload
sudo systemctl enable kanata
sudo systemctl restart kanata
