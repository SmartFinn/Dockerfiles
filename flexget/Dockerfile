FROM smartfinn/python3-alpine:latest
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

RUN apk --no-cache add --virtual .build-deps build-base python3-dev \
 && python3 -m pip --no-cache-dir install flexget cloudscraper transmissionrpc \
 && apk --no-cache del .build-deps \
 && mkdir /config \
 && touch /config/config.yml \
 && chown -R nobody:nogroup /config

WORKDIR /config

USER nobody

VOLUME ["/config", "/media"]

ENTRYPOINT ["flexget"]
CMD ["--cron", "daemon", "start"]
