FROM steamcmd/steamcmd

ENV HOME        /root

ENV SCRIPTS     $HOME/scripts
ENV INSTALLDIR  $HOME/.steam/steamapps/common

ENV STEAMAPPID  4020
ENV COMNAME     GarrysModDS
ENV GAMENAME    garrysmod

ENV SVPORT      27015
ENV SVPARAMS    "+exec server.cfg"

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 \
 && apt-get update -y \
 && apt-get install -y --no-install-recommends \
	lib32gcc1 \
	lib32stdc++6 \
	libtinfo5:i386 \
	libsdl2-2.0-0:i386 \
 && apt-get clean autoclean \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

ADD scripts/ $SCRIPTS
WORKDIR $SCRIPTS
RUN steamcmd \
	+quit

EXPOSE $SVPORT/udp
ENTRYPOINT ./srcds_install.sh \
        && ./srcds_start.sh
