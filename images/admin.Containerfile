FROM docker.io/briandipalma/base:latest

# CLI utilities
RUN pacman -Sq --noconfirm terraform ansible-core
