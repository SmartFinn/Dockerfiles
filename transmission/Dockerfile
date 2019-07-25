FROM alpine:latest
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV TRANSMISSION_HOME=/config \
    HOME=/media

COPY transmission.settings.json /config/settings.json

RUN apk --no-cache add transmission-daemon \
 && test -d /config || mkdir -p /config \
 && chown -R transmission:nogroup /config /media

EXPOSE 9091

USER transmission

VOLUME ["/config", "/media"]

ENTRYPOINT ["transmission-daemon"]
CMD ["--foreground", "--log-error"]
