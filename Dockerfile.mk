OWNER   ?= $(USER)
REPO    ?= $(notdir $(CURDIR))
TAG     ?= latest
IMAGE   ?= $(OWNER)/$(REPO):$(TAG)
NAME    ?= $(REPO)
DOCKER  ?= $(shell which docker)
OPTIONS ?= --interactive --rm --tty

up: run

attach diff inspect logs port stats top:
	@$(DOCKER) $@ $(NAME)

build:
	$(DOCKER) $@ --force-rm --tag $(IMAGE) $(CURDIR)

cleanup:
	@$(DOCKER) images -q -f "dangling=true" | \
		xargs -I {} $(DOCKER) rmi {}
	@$(DOCKER) volume ls -q -f "dangling=true" | \
		xargs -I {} $(DOCKER) volume rm {}

destroy: stop rm

history pull:
	@$(DOCKER) $@ $(IMAGE)

kill pause restart start stop unpause:
	@$(DOCKER) $@ $(NAME) | \
		xargs -I {} echo " ---> $@ container '{}'"

ps:
	@$(DOCKER) $@ -a --filter=name=$(NAME)

purge: stop rm rmi cleanup

push:
	$(DOCKER) login
	$(DOCKER) $@ $(IMAGE)

rebuild: rmi build

rm:
	@$(DOCKER) $@ --force --volumes $(NAME) | \
		xargs -I {} echo " ---> remove container '{}'"

rmi:
	@$(DOCKER) $@ $(IMAGE) | \
		xargs -I {} echo " ---> {}"

run:
	$(DOCKER) $@ $(OPTIONS) --name $(NAME) $(IMAGE)

shell:
	@$(DOCKER) exec -it $(NAME) sh -c "/bin/bash || /bin/sh"

supervisorctl:
	@$(DOCKER) exec -it $(NAME) $@

.PHONY: attach build cleanup destroy diff history inspect kill \
	logs pause port ps pull purge push rebuild restart rm rmi \
	run shell start stats stop supervisorctl top unpause up
