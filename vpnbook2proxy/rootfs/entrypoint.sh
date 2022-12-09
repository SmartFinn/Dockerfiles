#!/bin/sh

set -ex

: "${VPNBOOK_SERVER:=US1}"
: "${VPNBOOK_PORT:=udp25000}"
: "${VPNBOOK_USER:=vpnbook}"
: "${VPNBOOK_PASSWORD:-}"

# download and extract configs
wget --progress=dot:giga -O /tmp/vpnbook.zip \
	"https://www.vpnbook.com/free-openvpn-account/VPNBook.com-OpenVPN-$VPNBOOK_SERVER.zip"
unzip -o /tmp/vpnbook.zip -d /config
rm -f /tmp/vpnbook.zip

# try to get password if it's not set
if [ -z "$VPNBOOK_PASSWORD" ]; then
	VPNBOOK_PASSWORD=$(wget -qO- "https://nitter.net/vpnbook/rss" |
		awk -v RS='<[^>]+>' -v OFS='\n' '/Password:[ ]/ { print $7; exit }')
fi

if [ -z "$VPNBOOK_PASSWORD" ]; then
	echo "'VPNBOOK_PASSWORD' is not set." >&2
	exit 1
fi

# prepare tun device
mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
	mknod /dev/net/tun c 10 200
fi

VPNBOOK_SERVER_LOWER=$(echo "$VPNBOOK_SERVER" | tr '[:upper:]' '[:lower:]')
OVPNCONF="/config/vpnbook-${VPNBOOK_SERVER_LOWER}-${VPNBOOK_PORT}.ovpn"

if [ ! -f "$OVPNCONF" ]; then
	echo "'$OVPNCONF' is not exists." >&2
	exit 1
fi

# do not prompt user and password
sed -i '/^auth-user-pass/d' "$OVPNCONF"

# create an auth file
cat > /config/vpnbook.auth << EOF
$VPNBOOK_USER
$VPNBOOK_PASSWORD
EOF

# hide the permission warning
chmod 600 /config/vpnbook.auth

# get default gateway
DEFAULT_GATEWAY="$(ip route show | awk '/default/{print $3}')"

# add routes to private networks to allow connection to the proxy from the local network
ip route add 192.168.0.0/16 via "$DEFAULT_GATEWAY"
ip route add 172.16.0.0/12 via "$DEFAULT_GATEWAY"
ip route add 10.0.0.0/8 via "$DEFAULT_GATEWAY"

openvpn --script-security 2 --up /etc/openvpn/openvpn-up.sh \
	--auth-user-pass /config/vpnbook.auth \
	--connect-retry-max 5 \
	--config "$OVPNCONF"
