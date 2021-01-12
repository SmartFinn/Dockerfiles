FROM python:3-slim
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    MONITORRENT_VERSION="1.1.12" \
    MONITORRENT_DEBUG=false \
    MONITORRENT_IP=0.0.0.0 \
    MONITORRENT_PORT=6687 \
    MONITORRENT_DB_PATH=/config/monitorrent.db

RUN apt-get update \
 && apt-get install -y --no-install-recommends wget unzip \
 && rm -f /var/lib/apt/lists/*.* \
 && wget -O /tmp/monitorrent.zip \
    https://github.com/werwolfby/monitorrent/releases/download/$MONITORRENT_VERSION/monitorrent-$MONITORRENT_VERSION.zip \
 && unzip /tmp/monitorrent.zip -d /app \
 && rm -f /tmp/monitorrent.zip \
 && python3 -m pip --no-cache-dir install -r app/requirements.txt \
 && mkdir -p /config \
 && chown -R nobody:nogroup /app /config

EXPOSE 6687

USER nobody

VOLUME /config

WORKDIR /app

CMD ["python3", "server.py"]
