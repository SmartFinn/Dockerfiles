FROM smartfinn/python:alpine
MAINTAINER Sergei Eremenko <https://github.com/SmartFinn>

RUN pip --no-cache-dir install flexget transmissionrpc \
 && mkdir /config \
 && touch /config/config.yml \
 && chown -R nobody:nogroup /config

WORKDIR /config

USER nobody

VOLUME ["/config", "/media"]

ENTRYPOINT ["flexget"]
CMD ["--cron", "daemon", "start"]
