-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

VOLUME_DATA := "$(HOME)/.redis"

OWNER := smartfinn
REPO  := redis
RUN_OPTIONS := \
	--detach=true \
	--network=backend \
	--restart=unless-stopped \
	--user=$(shell id -u nobody):$(shell id -g nobody) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(VOLUME_DATA):/data

# create directory if not exist
RUN_HOOK := $(shell test -d "${VOLUME_DATA}" || \
	mkdir -p "${VOLUME_DATA}")
