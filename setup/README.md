# Workstation setup

Account name should be `brian` or `briand` for work machines.  
Upgrade host OS with package manager. Reboot.  
Copy over host SSH and WireGuard config.  
Setup SSH key, verify you can connect to GitHub.  
New SSH keys need to be copied to servers.
Set the correct hostname e.g.

```bash
sudo hostnamectl set-hostname brians-infinitybookpro14-popos
```

Install `flatpak` (via OS package manager).
Install `podman` (via OS package manager).  
Install `docker` (via OS package manager).
Install `distrobox` (via install script).

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
Run `repos.sh` from the `~/dev/iac/setup` directory, `exit` container.  
Create autostart, fish_history etc directories used in `links.sh` script for
new hostname.
Now in a **host** terminal and from the `~dev/iac/setup` directory run:

- `links.sh`
- `packages.sh`
- Start up SyncThingy and then shut it down, give it `Background` permission
- `gnome.sh`

Reboot.  
In a host terminal and from the `~dev/iac/setup` directory run `images.sh`.  
Login to your browser account and setup bookmarks/tabs/pinned tabs.
