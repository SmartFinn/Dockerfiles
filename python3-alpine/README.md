# ghcr.io/smartfinn/python3-alpine

lightweight [Python 3](http://www.python.org) Docker base image

## Versions

| Tag    | Python | Base image | Size |
|--------|--------|------------|------|
| latest | [![Alpine Linux Edge package](https://repology.org/badge/version-only-for-repo/alpine_edge/python.svg)](https://repology.org/project/python/versions) | alpine:latest | |

## Building from source

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/python3-alpine/
docker build --no-cache --force-rm --tag ghcr.io/smartfinn/python3-alpine .
```

## Usage

```dockerfile
FROM ghcr.io/smartfinn/python3-alpine:latest

RUN apk --no-cache add --virtual .build-deps build-base python3-dev \
 && python3 -m pip --no-cache-dir install <packages> \
 && apk --no-cache del .build-deps
```
