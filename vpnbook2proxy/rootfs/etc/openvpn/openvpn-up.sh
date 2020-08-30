#!/bin/sh

# wrapper script

# run normal up.sh script that sets DNS, etc
# /etc/openvpn/up.sh

# change external interface in sockd.conf
sed -i "s/external:[ ][a-zA-Z0-9-]\+$/external: ${dev:-tun0}/" /etc/sockd.conf

# run dante server
/usr/sbin/sockd &
