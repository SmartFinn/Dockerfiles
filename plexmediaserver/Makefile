-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

OWNER := smartfinn
REPO  := plexmediaserver
RUN_OPTIONS := \
	--detach=true \
	--publish=32400:32400
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.plexmediaserver:/config \
	--volume=/media:/media

# create directory if not exist
RUN_HOOK := $(shell test -d "${HOME}/.plexmediaserver" \
	|| mkdir -p "${HOME}/.plexmediaserver")
