FROM python:3-slim
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

COPY rootfs/ /

WORKDIR /config

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential python3-dev \
 && python3 -m pip --no-cache-dir install flexget transmission-rpc \
 && apt-get purge -y build-essential python3-dev \
 && apt-get autoremove --purge -y \
 && rm -f /var/lib/apt/lists/*.* \
 && touch /config/config.yml \
 && chown -R nobody:nogroup /config

USER nobody

EXPOSE 3539

VOLUME ["/config", "/media"]

ENTRYPOINT ["/entrypoint.sh"]
