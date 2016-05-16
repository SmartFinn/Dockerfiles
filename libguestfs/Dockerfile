FROM ubuntu:xenial
MAINTAINER Sergei Eremenko <https://github.com/SmartFinn>

ENV DEBIAN_FRONTEND=noninteractive \
    LIBGUESTFS_BACKEND=direct

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libguestfs-tools \
    linux-image-generic \
    qemu-utils \
    seabios \
    supermin \
 && update-guestfs-appliance \
 && rm -f /var/lib/apt/lists/*.*

CMD ["guestfish"]
