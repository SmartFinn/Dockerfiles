FROM node:lts-alpine
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ARG RELEASEBELL_VERSION=v1.8.0

ENV LANG=C.UTF-8 \
    NODE_ENV=production

COPY rootfs/ /

WORKDIR /app

RUN apk add --no-cache ca-certificates su-exec \
 && wget -O /tmp/app.tar.gz \
    https://git.cloudron.io/cloudron/releasebell/-/archive/$RELEASEBELL_VERSION/releasebell-$RELEASEBELL_VERSION.tar.gz \
 && tar -C /app --strip-components=1 -xvzf /tmp/app.tar.gz \
 && rm -f /tmp/app.tar.gz \
 && rm -rf /app/screenshots \
 && npm ci --omit=dev

EXPOSE 3000

ENTRYPOINT [ "/entrypoint.sh" ]
