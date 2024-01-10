#!/usr/bin/env bash

image=$(buildah from ubuntu:23.10)

buildah run "$image" -- apt update
buildah run "$image" -- apt upgrade -y

buildah commit "$image" briandipalma/dev
