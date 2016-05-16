-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := sass
OPTIONS := \
	--rm --user=$(shell id -u) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(CURDIR):/src
