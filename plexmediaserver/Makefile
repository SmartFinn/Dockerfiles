-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

OWNER := smartfinn
REPO  := plexmediaserver
RUN_OPTIONS := \
	--detach=true \
	--network=host \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.plexmediaserver:/config \
	--volume=/media:/media

# create directory if not exist
RUN_HOOK := $(shell test -d "${HOME}/.plexmediaserver" \
	|| mkdir -p "${HOME}/.plexmediaserver")
