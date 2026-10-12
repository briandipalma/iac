#! /bin/bash

printf '\nCloning and linking my-data\n'

HOST=$(hostnamectl hostname)

[ -d ~/dev/my-data ] || git clone git@github.com:briandipalma/my-data.git ~/dev/my-data

if [ -f ~/dev/my-data/hosts/"$HOST"/fish_history ]; then
  mkdir -p ~/.local/share/fish
  ln -sf ~/dev/my-data/hosts/"$HOST"/fish_history ~/.local/share/fish/fish_history
fi
