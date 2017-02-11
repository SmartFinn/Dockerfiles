FROM ubuntu:xenial
LABEL maintainer SmartFinn

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt-get update \
 && apt-get install -y ruby ruby-bundler \
 && rm -f /var/lib/apt/lists/*.*

CMD ["bash"]
