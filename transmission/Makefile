-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

OWNER := smartfinn
REPO  := transmission
RUN_OPTIONS := \
	--detach=true \
	--publish=9091:9091 \
	--restart=unless-stopped \
	--blkio-weight=400 \
	--cpu-shares=512 \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.transmission:/config \
	--volume=/media:/media

# create directory if not exist and copy the config
RUN_HOOK := $(shell test -d "${HOME}/.transmission" \
	|| mkdir -p "${HOME}/.transmission" \
	&& test -f "${HOME}/.transmission/settings.json" \
	|| cp transmission.settings.json "${HOME}/.transmission/settings.json")
