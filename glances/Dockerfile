FROM smartfinn/python:alpine
LABEL maintainer SmartFinn

RUN apk --no-cache add lm_sensors \
 && apk --no-cache add --virtual .build-deps \
    build-base linux-headers python-dev \
 && pip --no-cache-dir install glances \
    batinfo bernhard bottle docker-py elasticsearch influxdb \
    logutils netifaces pika potsdb psutil py-cpuinfo pymdstat \
    pysnmp pystache statsd zeroconf \
    https://bitbucket.org/gleb_zhulik/py3sensors/get/tip.tar.gz \
 && apk --no-cache del .build-deps

EXPOSE 61208 61209

ENTRYPOINT ["glances"]
CMD ["-w"]
