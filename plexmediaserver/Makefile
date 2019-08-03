-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := plexmediaserver
OPTIONS := \
	--detach=true \
	--net=host \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.plexmediaserver:/config \
	--volume=/media:/media
#	--publish=32400:32400

# create directory if not exist
EXECUTE := $(shell test -d "${HOME}/.plexmediaserver" \
	|| mkdir -p "${HOME}/.plexmediaserver")
