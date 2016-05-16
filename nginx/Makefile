-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := nginx
TAG     := xenial
OPTIONS := \
	--detach=true \
	--publish=80:80 \
	--restart=unless-stopped \
	--volume=/etc/localtime:/etc/localtime:ro \
	--volume=$(HOME)/html:/usr/share/nginx/html:ro

# create directory if not exist
EXECUTE := $(shell test -d "${HOME}/html" \
	|| mkdir -m 775 -p "${HOME}/html")
