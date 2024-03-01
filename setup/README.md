# Workstation setup

Use work login name for work machines e.g. `briand` instead of `brian`.
Upgrade host OS with package manager. Reboot.
Copy over host SSH and WireGuard config. Setup SSH key, verify you can connect
to GitHub.
Set the correct hostname e.g.

```bash
sudo hostnamectl set-hostname brians-xps13-popos
```

Install `flatpak` (may already be installed by OS package manager)
Install `podman` (via OS package manager)
Install `distrobox` (via install script).

```bash
distrobox create --name env --image docker.io/briandipalma/env:latest
```

```bash
distrobox enter env
```

Create and `cd` into `~/dev/` directory.
Clone this repo into it.

```bash
git clone git@github.com:briandipalma/iac.git
```

Run `repos.sh` from the `~/dev/iac/setup` directory, `exit` container.
Now in a **host** terminal and from the `~dev/iac/setup` directory run:

- `packages.sh`
- Start up SyncThingy and then shut it down, give it `Background` permission
- `links.sh`
- `gnome.sh`

Reboot
In a **host** terminal and from the `~dev/iac/setup` directory run `images.sh`.

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
