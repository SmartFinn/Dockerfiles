#!/bin/sh

set -e

# delete lock file before start
if [ -f /config/.config-lock ]; then
	rm -v /config/.config-lock
fi

# remove first arg if it's a command
if [ "$1" = "flexget" ] || [ "$1" = "/usr/bin/flexget" ]; then
	shift 1
fi

# default options if no args specified
# NOTE: `--autoreload-config` reloads the config *before* running the tasks,
# not when the configuration actually changes.
if [ -z "$1" ]; then
	set -- --loglevel INFO daemon start --autoreload-config
fi

exec flexget "$@"
