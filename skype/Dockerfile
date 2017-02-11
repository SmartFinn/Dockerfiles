FROM ubuntu:xenial
LABEL maintainer SmartFinn

ENV DEBIAN_FRONTEND=noninteractive \
    QT_X11_NO_MITSHM=1 \
    GNOME_DESKTOP_SESSION_ID=this-is-deprecated \
    PULSE_SERVER=/run/pulse/native \
    PULSE_LATENCY_MSEC=60

RUN dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get install -y curl \
 && curl -Lo /tmp/skype.deb http://www.skype.com/go/getskype-linux-deb-32 \
 && dpkg -i /tmp/skype.deb || true \
 && rm -f /tmp/skype.deb \
 && apt-get install -yf \
 && rm -f /var/lib/apt/lists/*.* \
 && echo enable-shm=no >> /etc/pulse/client.conf \
 && useradd --create-home --groups audio,video skype \
 && localedef --force -i en_US -f UTF-8 en_US.UTF-8 || true

USER skype

ENTRYPOINT ["skype"]
