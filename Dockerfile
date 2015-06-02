# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM ubuntu:15.04

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    lib32gcc1 \
    net-tools \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev \
    curl 

RUN mkdir -p /home/daemon/steamcmd  && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/daemon/steamcmd -zx && \
    chown -R daemon:daemon /home/daemon

WORKDIR /home/daemon/steamcmd
USER daemon

ONBUILD ADD install.txt /home/daemon/steamcmd/install.txt
ONBUILD RUN ./steamcmd.sh +runscript install.txt
