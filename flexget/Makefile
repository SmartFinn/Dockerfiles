-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

IMAGE := smartfinn/flexget
RUN_OPTIONS := \
	--detach=true \
	--publish=3539:3539 \
	--restart=unless-stopped \
	--user=$(shell id -u):$(shell id -g) \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/.flexget:/config \
	--volume=/media:/media

# create directory if not exist
pre-run::
	test -d "${HOME}/.$(NAME)" || mkdir -p "${HOME}/.$(NAME)"
