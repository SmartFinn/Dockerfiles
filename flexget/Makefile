-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

OWNER := smartfinn
REPO  := flexget
RUN_OPTIONS := \
	--detach=true \
	--publish=3539:3539 \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.flexget:/config \
	--volume=/media:/media

# create directory if not exist
RUN_HOOK := $(shell test -d "${HOME}/.flexget" || \
	mkdir -p "${HOME}/.flexget")
