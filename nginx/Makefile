-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk

APP_DATA := $(HOME)/.config/nginx

OWNER := smartfinn
REPO  := nginx
TAG   := latest
RUN_OPTIONS := \
	--detach=true \
	--publish=80:80/tcp \
	--publish=443:443/tcp \
	--restart=unless-stopped \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(APP_DATA):/etc/nginx/conf.d:ro

# create directory if not exist
pre-run::
	test -d "${APP_DATA}" || mkdir -m 775 -p "${APP_DATA}"
