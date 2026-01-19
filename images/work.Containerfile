FROM docker.io/briandipalma/base:latest

# Web app development
RUN pacman -Sq --noconfirm chromium
RUN npm install -g pnpm@10.28.0

# Required by karma chrome launcher
ENV CHROME_BIN=/usr/sbin/chromium

# Web app and backend development
RUN pacman -Sq --noconfirm jdk17-openjdk

# Web app servers and backend development
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
