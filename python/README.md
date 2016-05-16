smartfinn/python
================

lightweight [Python 2.7](http://www.python.org) Docker base images


Versions
--------

| Tag    | Python | Base image    | Virtual size |
|--------|--------|---------------|--------------|
| latest | 2.7.11 | ubuntu:xenial |       165 MB |
| xenial | 2.7.11 | ubuntu:xenial |       165 MB |
| alpine | 2.7.11 | alpine:latest |        53 MB |


Building from source
--------------------

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/python/<tag>
make build
```


Usage
-----

#### Ubuntu based build

```dockerfile
FROM smartfinn/python:xenial

ENV DEBIAN_FRONTEND=noninteractive

RUN BUILD_DEPS="build-essential python-all-dev" \
 && apt-get update \
 && apt-get install -y $BUILD_DEPS \
 && pip --no-cache-dir install <packages> \
 && apt-get purge -y $BUILD_DEPS \
 && apt-get autoremove -y \
 && rm -f /var/lib/apt/lists/*.*
```

#### Alpine based build

```dockerfile
FROM smartfinn/python:alpine

RUN apk --no-cache add --virtual .build-deps build-base python-dev \
 && pip --no-cache-dir install <packages> \
 && apk --no-cache del .build-deps
```
