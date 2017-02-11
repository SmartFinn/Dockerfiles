FROM ubuntu:xenial
LABEL maintainer SmartFinn

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y wget \
 ## Download and install Plex Media Server (non plexpass)
 && wget -O plexmediaserver.deb \
    'https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu' \
 && ln -sf /bin/true /usr/local/bin/start \
 && dpkg -i plexmediaserver.deb || true \
 && rm -f plexmediaserver.deb \
 && apt-get install -yf \
 && apt-get purge -y --auto-remove wget \
 && rm -f /var/lib/apt/lists/*.* \
 ## Create writable config directory in case the volume isn't mounted
 && mkdir -m 777 /config \
 && usermod -a -G users plex \
 && chown -R plex:users /config \
 ## Change the default parameters
 && sed -i '/PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR/s/#\?\s\?\(.\+=\).*$/\1\/config/' \
    /etc/default/plexmediaserver \
 ## Fixed issue with the performance and 6 channels audio encoding
 && sed -i '/name="audio.channels"/s/value="6"/value="2"/' \
    /usr/lib/plexmediaserver/Resources/Profiles/Web.xml

USER plex

EXPOSE 32400 1900/udp 3005 8324 32410/udp 32412-32414/udp 32469

VOLUME ["/config", "/media"]

ENTRYPOINT ["/usr/sbin/start_pms"]
