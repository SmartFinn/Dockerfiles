FROM ubuntu:xenial
MAINTAINER Sergei Eremenko <https://github.com/SmartFinn>

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    python-pip python-setuptools python-wheel \
 && pip --no-cache-dir install --upgrade pip setuptools \
 && rm -f /var/lib/apt/lists/*.*

CMD ["python"]
