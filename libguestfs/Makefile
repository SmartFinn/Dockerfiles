-include ../../Dockerfile.mk
-include ../Dockerfile.mk
-include Dockerfile.mk

OWNER   := smartfinn
REPO    := libguestfs
OPTIONS := \
	--interactive \
	--privileged \
	--rm \
	--tty \
	--volume=/var/lib/libvirt:/var/lib/libvirt \
	--volume=/var/run/libvirt/libvirt-sock-ro:/var/run/libvirt/libvirt-sock-ro:ro \
	--volume=/var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock:ro

tools := \
	guestfish \
	guestmount \
	guestunmount \
	virt-alignment-scan \
	virt-builder \
	virt-cat \
	virt-copy-in \
	virt-copy-out \
	virt-df \
	virt-edit \
	virt-filesystems \
	virt-format \
	virt-inspector \
	virt-list-filesystems \
	virt-list-partitions \
	virt-ls \
	virt-make-fs \
	virt-rescue \
	virt-resize \
	virt-sparsify \
	virt-sysprep \
	virt-tar \
	virt-tar-in \
	virt-tar-out \
	virt-win-reg

install:
	@test -d "$(HOME)/bin" || mkdir -v "$(HOME)/bin" || exit 1
	@for i in $(tools); do ln -v "$(CURDIR)/guestfish" "$(HOME)/bin/$$i"; done
