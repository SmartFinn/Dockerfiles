-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

IMAGE := smartfinn/vpnbook2proxy
RUN_OPTIONS := \
	--detach=true \
	--restart=unless-stopped \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	--publish=1080:1080 \
	--env VPNBOOK_SERVER=US1 \
	--dns 8.8.8.8 \
	--dns 8.8.4.4 \
	--volume=/etc/localtime:/etc/localtime:ro
