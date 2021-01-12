# DockerHelper.mk is a simple replacement for docker-compose for
# working with a single service.
#
# Usage Examples:
# - https://gist.github.com/SmartFinn/7bb86b078726f0763ce0#file-usage-md
# - https://github.com/SmartFinn/Dockerfiles
#
# @author: Sergei Eremenko (https://github.com/SmartFinn)
# @license: Unlicense (http://unlicense.org)
# @link: https://gist.github.com/SmartFinn/7bb86b078726f0763ce0

NAME   ?= $(notdir $(CURDIR))
IMAGE  ?= $(NAME)
DOCKER ?= docker
BUILD_OPTIONS ?= --force-rm
NET_NAME    ?= $(shell echo $(RUN_OPTIONS) | sed -rn "s/.*--net(|work)[= '\"]([^ '\"']+).*/\2/p")
NET_OPTIONS ?= --driver=bridge
RUN_COMMAND ?=
RUN_OPTIONS ?= --interactive --rm --tty

default: build

diff logs port stats top:
	@$(DOCKER) container $@ $(NAME)

build:
	$(DOCKER) build $(BUILD_OPTIONS) --tag $(IMAGE) $(CURDIR)

destroy: stop rm

down: stop rm rmi prune

images: ls

history ls pull:
	@$(DOCKER) image $@ $(IMAGE)

kill pause restart start stop unpause:
	@$(DOCKER) $@ $(NAME) | \
		xargs -I {} echo " ---> $@ container '{}'"

network:
	@if $(DOCKER) network ls -q --filter name='^$(NET_NAME)$$' | xargs -r false; then \
		NET_NAME="$(NET_NAME)"; \
		if test -n "$${NET_NAME%container:*}"; then \
			$(DOCKER) network create $(NET_OPTIONS) $(NET_NAME); \
		fi; \
	fi

networks:
	@$(DOCKER) network ls --filter=name=$(NET_NAME)

pre-run post-run::

prune:
	@$(DOCKER) system prune -f

ps:
	@$(DOCKER) container ls --all --filter=name=$(NAME)

push:
	$(DOCKER) image push $(IMAGE)

rebuild: rmi build

rm:
	@$(DOCKER) container rm --force --volumes $(NAME) | \
		xargs -I {} echo " ---> remove container '{}'"

rmi:
	@$(DOCKER) image rm $(IMAGE) | \
		xargs -I {} echo " ---> {}"

_run:
	$(DOCKER) run $(RUN_OPTIONS) --name $(NAME) $(IMAGE) $(RUN_COMMAND)

run: network pre-run _run post-run

shell:
	@$(DOCKER) container exec --interactive --tty $(NAME) \
		sh -c "/bin/bash || /bin/sh"

up: run

.PHONY: default build destroy down diff images history kill logs ls \
	network networks pause port post-run pre-run prune ps pull push \
	rebuild restart rm rmi _run run shell start stats stop top \
	unpause up
