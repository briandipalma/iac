#! /bin/bash

HOST="$1"

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

"${SUDO[@]}" sshd -t # Test SSH daemon configuration file
