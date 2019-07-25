# smartfinn/python3-alpine

lightweight [Python 3](http://www.python.org) Docker base image

## Versions

| Tag    | Python | Base image | Size |
|--------|--------|------------|------|
| latest | [![Alpine Linux Edge package](https://repology.org/badge/version-only-for-repo/alpine_edge/python3.svg)](https://repology.org/project/python3/versions) | alpine:latest | [![](https://images.microbadger.com/badges/image/smartfinn/python3-alpine.svg)](https://microbadger.com/images/smartfinn/python3-alpine "Get your own image badge on microbadger.com") |

## Building from source

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/python3-alpine/
make build
```

## Usage

```dockerfile
FROM smartfinn/python3-alpine:latest

RUN apk --no-cache add --virtual .build-deps build-base python-dev \
 && pip3 --no-cache-dir install <packages> \
 && apk --no-cache del .build-deps
```
