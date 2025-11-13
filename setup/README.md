# Workstation setup

## Before install

Backup SSH keys and WireGuard config file.

## During install

Account name should be `brian` or `briand` for work machines.

## After install

Verify the hostname. Upgrade host OS with package manager. Reboot. Setup `.ssh` directory.

### Docker

Install `docker`. Verify it works without needing root.

### Distrobox

Install `distrobox`, enter the `base` image.

```bash
distrobox create --name base --image docker.io/briandipalma/base:latest
```

```bash
distrobox enter base
```

### Git

Clone this repo to the `dev` directory.

```bash
git clone git@github.com:briandipalma/iac.git
```

Add the machine hostname to the `inventory.sh` file if it's missing. Run `repos.sh`

### Link configuration

Create host specific directories used in `links.sh` script for new hostnames. Run `links.sh`.
`exit` the container.

### Packages

Install `flatpak` if it's missing. Now in a **host** terminal from the `setup` directory run
`packages.sh`, the desktop scripts e.g. `kde.sh` and `images.sh`.

### Login

Login to your browser account, setup bookmarks etc, and login to packages scripts apps.
