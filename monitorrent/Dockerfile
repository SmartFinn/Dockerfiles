FROM smartfinn/python3:alpine
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV MONITORRENT_VERSION="1.1.10" \
    MONITORRENT_DEBUG=false \
    MONITORRENT_IP=0.0.0.0 \
    MONITORRENT_PORT=6687 \
    MONITORRENT_DB_PATH=/config/monitorrent.db

RUN apk --no-cache add --virtual .build-deps wget unzip \
 && wget --no-check-certificate -O /tmp/monitorrent.zip \
    https://github.com/werwolfby/monitorrent/releases/download/$MONITORRENT_VERSION/monitorrent-$MONITORRENT_VERSION.zip \
 && unzip /tmp/monitorrent.zip -d /app \
 && rm -f /tmp/monitorrent.zip \
 && apk --no-cache del .build-deps \
 ## https://github.com/werwolfby/monitorrent/issues/298
 && sed -i 's/falcon>=1.0.0/falcon==1.0.0/' app/requirements.txt \
 && pip3 --no-cache-dir install -r app/requirements.txt \
 && mkdir -p /config \
 && chown -R nobody:nogroup /app /config

EXPOSE 6687

USER nobody

VOLUME /config

WORKDIR /app

CMD ["python3", "server.py"]
