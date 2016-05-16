-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := mailcatcher
OPTIONS := \
	--interactive=true \
	--publish=1025:1025 \
	--publish=1080:1080 \
	--rm=true \
	--tty=true \
	--volume=/etc/localtime:/etc/localtime:ro
