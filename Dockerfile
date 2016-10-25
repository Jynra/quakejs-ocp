FROM registry.access.redhat.com/rhscl/nodejs-4-rhel7:latest
MAINTAINER bholmes

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY quakejs /usr/src/app
RUN npm install
COPY run.sh /usr/src/app


EXPOSE 27960

# Main
ENV QJS_FS_GAME="baseq3"
ENV QJS_DEDICATED="1"
ENV QJS_SERVER_CONFIG="server.cfg"

# Server
ENV QJS_SV_HOSTNAME="QAWS Server"
ENV QJS_SV_MAXCLIENTS="10"
ENV QJS_RCONPASSWORD="qaws"

# Game

# Game mode  0 (DM), 1 (T), 3 (TDM), 4 (CTF)
ENV QJS_G_GAMETYPE="0"
# Maps
# 0 q3dm1, q3dm7, q3dm17, q3tourney2, pro-q3tourney2, pro-q3tourney4, pro-q3dm6, pro-q3dm13
# 1 q3dm1, q3tourney2, pro-q3tourney2, pro-q3tourney4, pro-q3dm6, pro-q3dm13
# 3 q3dm7, pro-q3tourney2, pro-q3tourney4, pro-q3dm6, pro-q3dm13
# 4 q3tourney6_ctf

# Maps
ENV QJS_MAP="q3dm7" QJS_CAPTURELIMIT="8" QJS_FRAGLIMIT="10" QJS_TIMELIMIT="10"

# Bots
# Number of bots, 1-5      # Bot skill, 1-5
ENV QJS_BOT_MINPLAYERS="4" QJS_BOT_SKILL="1"

RUN chgrp -R 0 /usr/src/app
RUN chmod -R g+rw /usr/src/app
RUN find /usr/src/app -type d -exec chmod g+x {} +

CMD ["/bin/bash", "run.sh"]
