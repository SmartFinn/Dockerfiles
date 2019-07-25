-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := transmission
OPTIONS := \
	--detach=true \
	--net=host \
	--restart=unless-stopped \
	--blkio-weight=400 \
	--cpu-shares=512 \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.transmission:/config \
	--volume=/media:/media

# create directory if not exist and copy the config
EXECUTE := $(shell test -d "${HOME}/.transmission" \
	|| mkdir -p "${HOME}/.transmission" \
	&& test -f "${HOME}/.transmission/settings.json" \
	|| cp transmission.settings.json "${HOME}/.transmission/settings.json")
