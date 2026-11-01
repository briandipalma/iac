# PVE specific bash config

update() {
    if [[ $EUID -eq 0 ]]; then
        apt update && apt full-upgrade
    else
        sudo apt update && sudo apt full-upgrade
    fi
}
