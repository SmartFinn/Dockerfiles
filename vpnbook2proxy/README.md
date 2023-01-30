Based on https://github.com/dimovnike/alpine-openvpn and https://github.com/kressh/docker-dante-alpine

### Run

Here is an example command for running the container:

```
docker run \
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

#### Best experience with `podman` + `systemd`

```sh
podman run \
	--detach=true \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	--publish=1080:1080 \
	--env VPNBOOK_SERVER=US1 \
	--dns 8.8.8.8 \
	--dns 8.8.4.4 \
	--volume=/etc/localtime:/etc/localtime:ro \
	--name vpnbook2proxy \
	ghcr.io/smartfinn/vpnbook2proxy:latest

# generate systemd service
mkdir -p ~/.config/systemd/user/
cd ~/.config/systemd/user/
podman generate systemd --files --name --new --restart-policy on-failure vpnbook2proxy

# enable systemd service
systemctl --user daemon-reload
systemctl --user enable container-vpnbook2proxy.service

# remove current container and then run with systemd management (optionally, but recommended)
podman container stop vpnbook2proxy
podman container rm vpnbook2proxy
systemctl --user start container-vpnbook2proxy.service
```

### Testing

```
curl -x socks://localhost:1080 ifconfig.co
```
