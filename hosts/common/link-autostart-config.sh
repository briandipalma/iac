#! /bin/bash

printf '\nLinking autostart config\n'

HOST=$(hostnamectl hostname)

if [ -d ~/dev/iac/hosts/"$HOST"/autostart ]; then
  mkdir -p ~/.config/autostart
  for file in ~/dev/iac/hosts/"$HOST"/autostart/*.desktop; do
    [ -f "$file" ] || continue
    ln -sf "$file" ~/.config/autostart/
  done
fi
