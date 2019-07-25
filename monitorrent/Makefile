-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := monitorrent
OPTIONS := \
	--detach=true \
	--publish=6687:6687 \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.monitorrent:/config

# create directory if not exist
EXECUTE := $(shell test -d "${HOME}/.monitorrent" || \
	mkdir -p "${HOME}/.monitorrent")
