# Images

Remove the old Distrobox containers

`distrobox assemble rm`

Then build your new Distrobox containers

`distrobox assemble create`

Then enter your new Distrobox container

`distrobox enter base`

Using the name in the `distrobox.ini` file

## Building locally

`buildah build -f base.Containerfile`
