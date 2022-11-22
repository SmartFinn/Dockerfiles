Based on https://github.com/dimovnike/alpine-openvpn and https://github.com/kressh/docker-dante-alpine

### Run

Here is an example command for running the container:

```
docker run
	--detach=true \
	--restart=unless-stopped \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	--publish=1080:1080 \
	--env VPNBOOK_SERVER=US1 \
	--dns 8.8.8.8 \
	--dns 8.8.4.4 \
	--volume=/etc/localtime:/etc/localtime:ro \
	ghcr.io/smartfinn/vpnbook2proxy:latest
```

### Testing

```
curl -x socks://localhost:1080 ifconfig.co
```
