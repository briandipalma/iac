#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

# Applying the connection drops any SSH session on the old IP, run from the Proxmox console or reconnect to the new IP

printf '\nSetting static IP 192.168.1.30\n'

sudo nmcli con mod "Wired connection 1" \
	ipv4.method manual \
	ipv4.addresses 192.168.1.30/24 \
	ipv4.gateway 192.168.1.1 \
	ipv4.dns "192.168.1.2 192.168.1.3" \
	ipv4.dns-search test

sudo nmcli con up "Wired connection 1"
