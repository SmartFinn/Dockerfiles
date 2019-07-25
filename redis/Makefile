-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

VOLUME_DATA := "$(HOME)/.redis"

OWNER   := smartfinn
REPO    := redis
OPTIONS := \
	--detach=true \
	--publish=6379:6379 \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(VOLUME_DATA):/data

# create directory if not exist
EXECUTE := $(shell test -d "${VOLUME_DATA}" || \
	mkdir -p "${VOLUME_DATA}")
