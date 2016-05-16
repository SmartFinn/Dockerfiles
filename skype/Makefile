-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER := smartfinn
REPO  := skype
OPTIONS := \
	--rm --privileged \
	--env="DISPLAY=unix$(DISPLAY)" \
	--env="LANG=$(LANG)" \
	--user=$(shell id -u) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=/etc/group:/etc/group:ro \
	--volume=/etc/passwd:/etc/passwd:ro \
	--volume=/run/user/$(shell id -u)/pulse:/run/pulse:ro \
	--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
	--volume=$(HOME)/.Skype:$(HOME)/.Skype \
	--volume=$(HOME)/Downloads:$(HOME)/Downloads

# create directory if not exist
EXECUTE := $(shell test -d "${HOME}/.Skype" || \
	mkdir -p -m 700 "${HOME}/.Skype")
