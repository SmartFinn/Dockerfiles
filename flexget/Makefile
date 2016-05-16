-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := flexget
OPTIONS := \
	--detach=true \
	--publish=3539:3539 \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.flexget:/config \
	--volume=/media:/media

# create directory if not exist
EXECUTE := $(shell test -d "${HOME}/.flexget" || \
	mkdir -p "${HOME}/.flexget")
