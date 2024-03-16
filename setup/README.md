# Workstation setup

Account name should be `brian` or `briand` for work machines.
Upgrade host OS with package manager. Reboot.
Copy over host SSH and WireGuard config.
Setup SSH key, verify you can connect to GitHub.
Set the correct hostname e.g.

```bash
sudo hostnamectl set-hostname brians-xps13-popos
```

Install `flatpak` (may already be installed by OS package manager).
Install `podman` (via OS package manager).
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

Run `repos.sh` from the `~/dev/iac/setup` directory, `exit` container.
Now in a **host** terminal and from the `~dev/iac/setup` directory run:

- `packages.sh`
- Start up SyncThingy and then shut it down, give it `Background` permission
- `links.sh`
- `gnome.sh`

Reboot.
In a **host** terminal and from the `~dev/iac/setup` directory run `images.sh`.
Login to your browser account and setup bookmarks/tabs/pinned tabs.
Install browser extensions.
