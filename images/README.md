# Images

Containerfiles for personal/work CLI usage, to limit what's installed on the host/make my CLI
environment more host independent.

## Distrobox Commands

Remove the old Distrobox containers

`distrobox assemble rm`

Then build your new Distrobox containers

`distrobox assemble create`

Then enter your new Distrobox container

`distrobox enter base`

Using the name in the `distrobox.ini` file

## Building locally

`buildah build -f base.Containerfile`
