FROM ubuntu:xenial
MAINTAINER Sergei Eremenko <https://github.com/SmartFinn>

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    python3-pip python3-setuptools python3-wheel \
 && pip3 --no-cache-dir install --upgrade pip setuptools \
 && rm -f /var/lib/apt/lists/*.*

CMD ["python3"]
