#!/usr/bin/env bash

image=$(buildah from ubuntu:23.10)

buildah run "$image" -- apt update
buildah run "$image" -- apt upgrade -y

buildah run "$image" -- apt install -y curl

buildah run "$image" -- curl -L https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb --output bat.deb
buildah run "$image" -- dpkg --install bat.deb
buildah run "$image" -- rm bat.deb

buildah commit "$image" briandipalma/env
