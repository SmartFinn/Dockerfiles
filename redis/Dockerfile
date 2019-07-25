FROM alpine:latest
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV LANG=C.UTF-8

COPY rootfs/ /

RUN apk --no-cache add redis su-exec \
 && mkdir -p /data \
 && chown -R redis:redis /data

EXPOSE 6379

VOLUME /data

WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["redis-server", "/etc/redis.conf"]
