-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

VOLUME_DATA := "$(HOME)/.redis"

OWNER := smartfinn
REPO  := redis
RUN_OPTIONS := \
	--detach=true \
	--publish=6379:6379 \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(VOLUME_DATA):/data

# create directory if not exist
RUN_HOOK := $(shell test -d "${VOLUME_DATA}" || \
	mkdir -p "${VOLUME_DATA}")
