-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := webvirtmgr
OPTIONS := \
	--detach=true \
	--hostname $(NAME) \
	--publish 6080:6080 \
	--publish 8000:8000 \
	--restart=unless-stopped \
	--volume /etc/localtime:/etc/localtime:ro \
	--volume /var/lib/libvirt:/var/lib/libvirt \
	--volume /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock
