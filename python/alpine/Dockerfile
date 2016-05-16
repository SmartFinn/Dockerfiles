FROM alpine:latest
MAINTAINER Sergei Eremenko <https://github.com/SmartFinn>

ENV LANG=C.UTF-8

RUN apk --no-cache add ca-certificates python py-pip \
 && pip --no-cache-dir install --upgrade pip setuptools

CMD ["python"]
