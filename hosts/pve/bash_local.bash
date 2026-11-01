# PVE specific bash config

update() {
    if [[ $EUID -eq 0 ]]; then
        apt update && apt full-upgrade
    else
        sudo apt update && sudo apt full-upgrade
    fi
}

cleanup() {
    local sudo_cmd=()
    if [[ $EUID -ne 0 ]]; then
        sudo_cmd=(sudo)
    fi

    printf '\nRemoving unused packages\n'
    "${sudo_cmd[@]}" apt autoremove && "${sudo_cmd[@]}" apt autoclean

    printf '\nVacuuming systemd journal\n'
    "${sudo_cmd[@]}" journalctl --vacuum-size=500M

    printf '\nCleaning temporary files\n'
    "${sudo_cmd[@]}" systemd-tmpfiles --clean

    printf '\nDiscarding unused blocks on mounted filesystems\n'
    "${sudo_cmd[@]}" fstrim -av
}
