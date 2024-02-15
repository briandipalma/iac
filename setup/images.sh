distrobox rm env --force

distrobox create --image docker.io/briandipalma/env:latest \
	--name env \
	--pull \
	--additional-flags "--hostname ${HOSTNAME}" \
	--pre-init-hooks "SHELL=/usr/bin/fish"

distrobox enter env
