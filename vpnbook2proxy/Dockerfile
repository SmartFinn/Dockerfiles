FROM alpine:latest
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV VPNBOOK_SERVER="US1" \
    VPNBOOK_PORT="udp25000" \
    VPNBOOK_USER="vpnbook" \
    VPNBOOK_PASSWORD=""

RUN apk --no-cache add dante-server openvpn wget unzip

COPY rootfs/ /

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh"]
