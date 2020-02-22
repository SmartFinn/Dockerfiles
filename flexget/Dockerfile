FROM ubuntu:bionic
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt-get update \
 && apt-get install -y --no-install-recommends python3-minimal python3-pip \
 && rm -f /var/lib/apt/lists/*.* \
 && python3 -m pip --no-cache-dir install --upgrade pip setuptools \
 && python3 -m pip --no-cache-dir install flexget cloudscraper transmissionrpc \
 && mkdir /config \
 && touch /config/config.yml \
 && chown -R nobody:nogroup /config

WORKDIR /config

USER nobody

VOLUME ["/config", "/media"]

ENTRYPOINT ["flexget"]
CMD ["--cron", "daemon", "start"]
