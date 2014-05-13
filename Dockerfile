# steamcmd run as user daemon
# https://developer.valvesoftware.com/wiki/SteamCMD#Linux 

FROM debian:jessie

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    lib32gcc1 \
    curl 

RUN mkdir -p /home/games/steamcmd  && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/games/steamcmd -zx && \
    chown -R games:games /home/games

WORKDIR /home/games/steamcmd
USER games

CMD ["./home/games/steamcmd/steamcmd.sh"]
