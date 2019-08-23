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

OWNER  ?= $(USER)
REPO   ?= $(notdir $(CURDIR))
TAG    ?= latest
IMAGE  ?= $(OWNER)/$(REPO):$(TAG)
NAME   ?= $(REPO)
DOCKER ?= docker
BUILD_OPTIONS ?= --force-rm
RUN_COMMAND   ?=
RUN_OPTIONS   ?= --interactive --rm --tty

default: build

diff logs port stats top:
	@$(DOCKER) container $@ $(NAME)

build:
	$(DOCKER) build $(BUILD_OPTIONS) --tag $(IMAGE) $(CURDIR)

destroy: stop rm

images: ls

history ls pull:
	@$(DOCKER) image $@ $(IMAGE)

kill pause restart start stop unpause:
	@$(DOCKER) $@ $(NAME) | \
		xargs -I {} echo " ---> $@ container '{}'"

prune:
	@$(DOCKER) system prune -f

ps:
	@$(DOCKER) container ps -a --filter=name=$(NAME)

purge: stop rm rmi prune

push:
	$(DOCKER) login
	$(DOCKER) image push $(IMAGE)

rebuild: rmi build

rm:
	@$(DOCKER) container rm --force --volumes $(NAME) | \
		xargs -I {} echo " ---> remove container '{}'"

rmi:
	@$(DOCKER) image rm $(IMAGE) | \
		xargs -I {} echo " ---> {}"

run:
	$(DOCKER) run $(RUN_OPTIONS) --name $(NAME) $(IMAGE) $(RUN_COMMAND)

shell:
	@$(DOCKER) container exec --interactive --tty $(NAME) \
		sh -c "/bin/bash || /bin/sh"

up: run

.PHONY: default build destroy diff images history kill logs ls pause \
	port prune ps pull purge push rebuild restart rm rmi run shell \
	start stats stop top unpause up
