FROM docker.io/briandipalma/base:latest

# GitLab.nvim
RUN pacman -Sq --noconfirm go

# Web app development
RUN pacman -Sq --noconfirm pnpm chromium

# Required by karma chrome launcher
ENV CHROME_BIN=/usr/sbin/chromium

# Web app and backend development
RUN pacman -Sq --noconfirm jdk17-openjdk

# Web app servers and backend development
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
