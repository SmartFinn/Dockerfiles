smartfinn/python
================

lightweight [Python 2.7](http://www.python.org) Docker base images


Versions
--------

| Tag    | Python | Base image    | Size                                                                                                                                                                                |
|--------|--------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| latest | 2.7.12 | ubuntu:xenial | [![](https://images.microbadger.com/badges/image/smartfinn/python:latest.svg)](http://microbadger.com/images/smartfinn/python:latest "Get your own image badge on microbadger.com") |
| xenial | 2.7.12 | ubuntu:xenial | [![](https://images.microbadger.com/badges/image/smartfinn/python:xenial.svg)](http://microbadger.com/images/smartfinn/python:xenial "Get your own image badge on microbadger.com") |
| alpine | 2.7.13 | alpine:latest | [![](https://images.microbadger.com/badges/image/smartfinn/python:alpine.svg)](http://microbadger.com/images/smartfinn/python:alpine "Get your own image badge on microbadger.com") |


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
