-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

OWNER := smartfinn
REPO  := nginx
TAG   := latest
RUN_OPTIONS := \
	--detach=true \
	--publish=80:80 \
	--restart=unless-stopped \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/html:/usr/share/nginx/html:ro

# create directory if not exist
RUN_HOOK := $(shell test -d "${HOME}/html" \
	|| mkdir -m 775 -p "${HOME}/html")
