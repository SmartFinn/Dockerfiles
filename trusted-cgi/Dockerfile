FROM python:3-slim
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ARG TRUSTED_CGI_VER=v0.3.6

ENV DEBIAN_FRONTEND=noninteractive \
    INITIAL_ADMIN_PASSWORD=admin \
    BIND=0.0.0.0:3434

RUN apt-get update \
 && apt-get install -y --no-install-recommends wget make git openssh-client \
 && mkdir -p /tmp/trusted-cgi \
 && wget --progress=dot:giga -O /tmp/trusted-cgi/trusted-cgi.tar.gz \
    https://github.com/reddec/trusted-cgi/releases/download/$TRUSTED_CGI_VER/trusted-cgi_linux_amd64.tar.gz \
 && tar -C /tmp/trusted-cgi -xzvf /tmp/trusted-cgi/trusted-cgi.tar.gz \
 && cp -v /tmp/trusted-cgi/trusted-cgi /usr/local/bin/trusted-cgi \
 && rm -rf /tmp/trusted-cgi \
 && rm -f /var/lib/apt/lists/*.*

VOLUME /data
WORKDIR /data

CMD ["trusted-cgi", "--disable-chroot"]
