# Workstation setup

## Pre-setup

1. `HOME` environmental variable is used during repo setup, verify it's correct.
2. Verify hostname is in Ansible inventory.
3. Verify `flatpak` is already installed.
4. Upgrade host OS with package manager. Reboot.

## Setup

1. Setup host SSH key.
2. Install `podman` and `distrobox`.
3. Pull dev container image.

   ```bash
   distrobox create --name env --image docker.io/briandipalma/env:latest
   distrobox enter env
   ```

4. From container run Ansible workstation bootstrap playbook.

   ```bash
   ansible-pull --url https://github.com/briandipalma/iac.git --inventory ansible/workstations/inventory.ini ansible/workstations/bootstrap.yaml
   ```

5. Run the `links.sh` script in this repo/directory.
6. Run Ansible workstation playbook.
