FROM docker.io/briandipalma/base:latest

# GitLab.nvim
RUN pacman -Sq --noconfirm go

# Web app development
RUN pacman -Sq --noconfirm pnpm chromium

# Required by karma chrome launcher
ENV CHROME_BIN=/usr/sbin/chromium

# Java development tooling - jdtls
RUN pacman -Sq --noconfirm jdk21-openjdk
# Web app and backend development
RUN pacman -Sq --noconfirm jdk11-openjdk

# Web app servers and backend development
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
