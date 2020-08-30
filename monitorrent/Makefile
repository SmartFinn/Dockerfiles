-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

OWNER := smartfinn
REPO  := monitorrent
RUN_OPTIONS := \
	--detach=true \
	--restart=unless-stopped \
	--publish=6687:6687 \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.monitorrent:/config

# create directory if not exist
pre-run::
	test -d "${HOME}/.monitorrent" || mkdir -p "${HOME}/.monitorrent"
