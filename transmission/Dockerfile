FROM alpine:latest
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV TRANSMISSION_HOME=/config \
    HOME=/config

RUN apk --no-cache add transmission-daemon \
 && test -d /config || mkdir -p /config \
 && chown -R transmission:nobody /config /media

COPY transmission.settings.json /config/settings.json

EXPOSE 9091

USER transmission

VOLUME ["/config", "/media"]

ENTRYPOINT ["transmission-daemon"]
CMD ["--foreground", "--log-error"]
