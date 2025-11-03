# Workstation setup

## Before install

Backup SSH keys and WireGuard config file.

## During install

Account name should be `brian` or `briand` for work machines.

## After install

Verify the hostname if not change it e.g.

```bash
sudo hostnamectl set-hostname brians-infinitybookpro14-popos
```

Upgrade host OS with package manager. Reboot. Not required on CachyOS.
Setup SSH key, verify you can connect to GitHub.

### Docker

Install `docker` (via OS package manager). Set docker up to be run by a non root user i.e. create
docker group and add user to docker group. Enable docker service.

```bash
sudo systemctl enable docker
```

### Distrobox

Install `distrobox` (via OS package manager if up to date i.e. Arch linux or install script if not).

```bash
distrobox create --name base --image docker.io/briandipalma/base:latest
```

```bash
distrobox enter base
```

Create and `cd` into `~/dev/` directory.  
Clone this repo into it.

```bash
git clone git@github.com:briandipalma/iac.git
```

Add the machine hostname to the `~/dev/iac/setup/inventory.sh` file if it's not there.
Run `repos.sh` from the `~/dev/iac/setup` directory and `exit` the container.

Create autostart, fish_history etc directories used in `links.sh` script for
new hostname.
Install `flatpak` (via OS package manager).

Now in a **host** terminal and from the `~dev/iac/setup` directory run:

- `links.sh`
- `packages.sh`
- Start up SyncThingy and then shut it down, give it `Background` permission
- `gnome.sh`

Reboot.  
In a host terminal and from the `~dev/iac/setup` directory run `images.sh`.  
Login to your browser account and setup bookmarks/tabs/pinned tabs.
