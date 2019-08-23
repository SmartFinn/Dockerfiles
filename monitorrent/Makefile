-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

OWNER := smartfinn
REPO  := monitorrent
RUN_OPTIONS := \
	--detach=true \
	--publish=6687:6687 \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.monitorrent:/config

# create directory if not exist
RUN_HOOK := $(shell test -d "${HOME}/.monitorrent" || \
	mkdir -p "${HOME}/.monitorrent")
