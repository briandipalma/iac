# Images

Firstly create your image

`./build-arch-standard-env.sh`

Then remove the old Distrobox containers

`distrobox assemble rm`

Then build your new Distrobox containers

`distrobox assemble create`

Then enter your new Distrobox container

`distrobox enter arch-standard-env`

Using the name in the `distrobox.ini` file
