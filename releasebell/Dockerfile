FROM node:lts-alpine
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV LANG=C.UTF-8 \
    NODE_ENV=production \
    VERSION=v1.5.2

COPY rootfs/ /

WORKDIR /app

RUN apk add --no-cache ca-certificates su-exec python3 make \
 && wget -O /tmp/app.tar.gz \
    https://git.cloudron.io/cloudron/releasebell/-/archive/$VERSION/releasebell-$VERSION.tar.gz \
 && tar -C /app --strip-components=1 -xvzf /tmp/app.tar.gz \
 && rm -f /tmp/app.tar.gz \
 && rm -rf /app/screenshots \
 && npm install --production

EXPOSE 3000

ENTRYPOINT [ "/entrypoint.sh" ]
