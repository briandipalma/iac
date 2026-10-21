#! /bin/bash

HOST="${1:-$(hostnamectl hostname)}"

if [[ ! -f ~/dev/iac/hosts/"$HOST"/authorized_keys ]]; then
	echo "Usage: setup-ssh.sh <host>, no authorized_keys found for host '$HOST'" >&2
	exit 1
fi

if [[ $EUID -eq 0 ]]; then
	SUDO=()
else
	SUDO=(sudo)
fi

printf '\nSetting up SSH\n'

mkdir -p -m 700 ~/.ssh
ln -sf ~/dev/iac/hosts/"$HOST"/authorized_keys ~/.ssh/authorized_keys
# sshd uses the first value it reads, a low number prefix makes this win over later drop-ins
echo "PasswordAuthentication no" | "${SUDO[@]}" tee /etc/ssh/sshd_config.d/10-no-password.conf >/dev/null
echo "PermitRootLogin no" | "${SUDO[@]}" tee /etc/ssh/sshd_config.d/10-no-root-login.conf >/dev/null

"${SUDO[@]}" sshd -t # Test SSH daemon configuration file

# The service is sshd on Arch and ssh on Debian (pve, rpi4)
if systemctl list-unit-files sshd.service >/dev/null; then
	"${SUDO[@]}" systemctl reload sshd
else
	"${SUDO[@]}" systemctl reload ssh
fi
