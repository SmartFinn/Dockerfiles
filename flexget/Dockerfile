FROM python:3-slim
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

COPY rootfs/ /

WORKDIR /config

RUN python3 -m pip --no-cache-dir install flexget transmission-rpc \
 && touch /config/config.yml \
 && chown -R nobody:nogroup /config

USER nobody

EXPOSE 3539

VOLUME ["/config"]

ENTRYPOINT ["/entrypoint.sh"]
