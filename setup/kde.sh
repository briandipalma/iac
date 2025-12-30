#! /bin/bash

# Workspaces settings

kwriteconfig6 --file kwinrc --group Desktops --key Number 9
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 1" "none,Meta+1,Activate Task Manager Entry 1"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 1" "Meta+1,Ctrl+F1,Switch to Desktop 1"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 2" "none,Meta+2,Activate Task Manager Entry 2"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 2" "Meta+2,Ctrl+F2,Switch to Desktop 2"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 3" "none,Meta+3,Activate Task Manager Entry 3"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 3" "Meta+3,Ctrl+F3,Switch to Desktop 3"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 4" "none,Meta+4,Activate Task Manager Entry 4"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 4" "Meta+4,Ctrl+F4,Switch to Desktop 4"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 5" "none,Meta+5,Activate Task Manager Entry 5"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 5" "Meta+5,,Switch to Desktop 5"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 6" "none,Meta+6,Activate Task Manager Entry 6"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 6" "Meta+6,,Switch to Desktop 6"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 7" "none,Meta+7,Activate Task Manager Entry 7"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 7" "Meta+7,,Switch to Desktop 7"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 8" "none,Meta+8,Activate Task Manager Entry 8"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 8" "Meta+8,,Switch to Desktop 8"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "activate task manager entry 9" "none,Meta+9,Activate Task Manager Entry 9"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch to Desktop 9" "Meta+9,,Switch to Desktop 9"

kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window Maximize" "Meta+M,Meta+PgUp,Maximise Window"
kwriteconfig6 --file kglobalshortcutsrc --group plasmashell --key "manage activities" "none,Meta+Q,Show Activity Switcher"

kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window Close" "Meta+Q,Alt+F4,Close Window"

kwriteconfig6 --file kglobalshortcutsrc --group services --group "org.kde.dolphin.desktop" --key "_launch" "Meta+F"
kwriteconfig6 --file kglobalshortcutsrc --group services --group "org.kde.krunner.desktop" --key "_launch" "Meta+Space"

# Unset default Meta+L as it's a movement key
kwriteconfig6 --file kglobalshortcutsrc --group ksmserver --key "Lock Session" "Screensaver,Meta+L,Lock Session"

kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch Window Down" "Meta+J,Meta+Alt+Down,Switch to Window Below"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch Window Left" "Meta+H,Meta+Alt+Left,Switch to Window to the Left"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch Window Right" "Meta+L,Meta+Alt+Right,Switch to Window to the Right"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch Window Up" "Meta+K,Meta+Alt+Up,Switch to Window Above"

kwriteconfig6 --file kwinrc --group NightColor --key Active true

# Host specific configuration

if [ -f ~/dev/iac/dotfiles/$HOSTNAME/kscreenlockerrc ]; then
  ln -sf ~/dev/iac/dotfiles/$HOSTNAME/kscreenlockerrc ~/.config/
fi

if [ -f ~/dev/iac/dotfiles/$HOSTNAME/powerdevilrc ]; then
  ln -sf ~/dev/iac/dotfiles/$HOSTNAME/powerdevilrc ~/.config/
fi
