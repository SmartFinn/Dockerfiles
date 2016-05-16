-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := glances
OPTIONS := \
	--detach=true \
	--net=host \
	--pid=host \
	--publish=61208-61209:61208-61209 \
	--restart=unless-stopped \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=/var/run/docker.sock:/var/run/docker.sock:ro
