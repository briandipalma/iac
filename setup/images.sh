#! /bin/bash

source inventory.sh

distrobox rm base --force

distrobox create --image docker.io/briandipalma/base:latest \
	--name base \
	--pull \
	--pre-init-hooks "SHELL=/usr/bin/fish"

if [[ ${personalWorkstations[@]} =~ $HOSTNAME ]]; then
	distrobox rm admin --force

	distrobox create --image docker.io/briandipalma/admin:latest \
		--name admin \
		--pull \
		--pre-init-hooks "SHELL=/usr/bin/fish"

	distrobox enter admin
fi

if [[ ${workWorkstations[@]} =~ $HOSTNAME ]]; then
	distrobox rm work --force

	distrobox create --image docker.io/briandipalma/work:latest \
		--name work \
		--pull \
		--additional-flags "--hostname ${HOSTNAME}" \
		--pre-init-hooks "SHELL=/usr/bin/fish"

	distrobox enter work
fi

distrobox enter base
