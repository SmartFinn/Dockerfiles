FROM alpine:latest
MAINTAINER Sergei Eremenko <https://github.com/SmartFinn>

ENV LANG=C.UTF-8

# http://bugs.alpinelinux.org/issues/5103
RUN apk --no-cache add ca-certificates python3 \
 && python3 -m ensurepip \
 && pip3 --no-cache-dir install --upgrade pip setuptools

CMD ["python3"]
