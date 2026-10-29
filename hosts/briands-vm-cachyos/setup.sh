#! /bin/bash

# Set bash options to make the script stop at first error:
# `-e` errexit (unexpected command failure i.e. not a test)
# `-u` fail on unset variable use
# `-o pipefail` pipeline fails if any command in it fails
set -euo pipefail

printf '\nSetting hostname\n'

sudo hostnamectl set-hostname briands-vm-cachyos

# Common setup steps

source ~/dev/iac/hosts/common/link-shell-config.sh
source ~/dev/iac/hosts/common/link-my-data.sh
source ~/dev/iac/hosts/common/install-cli-packages-cachyos.sh
source ~/dev/iac/hosts/common/install-work-packages-cachyos.sh

# Host specific setup steps

printf '\nInstalling VM CLI programs\n'

sudo pacman -S --needed --noconfirm \
	bat \
	chafa \
	chromium \
	docker \
	docker-buildx \
	docker-compose \
	fd \
	fzf \
	gemini-cli \
	git-delta \
	glab \
	jdk17-openjdk \
	jdk21-openjdk \
	kitty-terminfo \
	lazygit \
	lsd \
	neovim \
	nodejs-lts-krypton \
	npm \
	ripgrep \
	starship \
	trash-cli \
	tree-sitter-cli \
	zoxide
shelly install aur --needed --no-confirm claude-code
claude plugin install mattpocock-skills@claude-plugins-official
shelly install aur --needed --no-confirm herdr-bin
sudo npm install -g pnpm@10.28.0
sudo npm install -g --allow-scripts=bun bun@1.4.2

printf '\nSetting up Docker\n'

sudo usermod -aG docker "$USER" # For non root use, Arch creates docker group, no need to create it
sudo systemctl enable --now docker

source ~/dev/iac/hosts/common/setup-ssh.sh briands-vm-cachyos

printf '\nMaking directories e.g. Downloads\n'

mkdir -p ~/Downloads

printf '\nNext steps:\n'
printf '  1. Log out and back in (docker group)\n'
printf '  2. Log in to NetBird (netbird up)\n'
printf '  3. ~/dev/iac/hosts/common/clone-work-repos.sh\n'
printf '  4. Log in to glab and Claude\n'
printf '  5. Install the Fleet agent (orbit) package from the Fleet server and check enrolment\n'
