-include ../../DockerHelper.mk
-include ../DockerHelper.mk
-include DockerHelper.mk
-include ../common_vars.mk
-include secrets.mk

IMAGE := smartfinn/releasebell
RUN_OPTIONS := \
	--detach=true \
	--restart=unless-stopped \
	--publish=3000:3000 \
	--env CLOUDRON_MAIL_SMTP_SERVER=$(MAIL_SMTP_SERVER) \
	--env CLOUDRON_MAIL_SMTP_PORT=$(MAIL_SMTP_PORT) \
	--env CLOUDRON_MAIL_SMTP_USERNAME=$(MAIL_SMTP_USERNAME) \
	--env CLOUDRON_MAIL_SMTP_PASSWORD=$(MAIL_SMTP_PASSWORD) \
	--env CLOUDRON_MAIL_FROM=$(MAIL_SMTP_USERNAME) \
	--env CLOUDRON_MAIL_DOMAIN=$(shell sed -rn 's/.*@//p' <<< $(MAIL_SMTP_USERNAME)) \
	--env CLOUDRON_APP_ORIGIN=$(NAME).$(DOMAIN) \
	--env CLOUDRON_MYSQL_HOST=mariadb \
	--env CLOUDRON_MYSQL_USERNAME=$(MYSQL_USERNAME) \
	--env CLOUDRON_MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
	--env CLOUDRON_MYSQL_DATABASE=$(MYSQL_DATABASE) \
	--env RELEASEBELL_USERNAME=$(RELEASEBELL_USERNAME) \
	--env RELEASEBELL_PASSWORD=$(RELEASEBELL_PASSWORD) \
	--env RELEASEBELL_EMAIL=$(RELEASEBELL_EMAIL) \
	--volume=/etc/localtime:/etc/localtime:ro
