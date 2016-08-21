smartfinn/python3
=================

lightweight [Python 3.5](http://www.python.org) Docker base images


Versions
--------

| Tag    | Python | Base image    | Size                                                                                                                                                                                  |
|--------|--------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| latest | 3.5.2  | ubuntu:xenial | [![](https://images.microbadger.com/badges/image/smartfinn/python3:latest.svg)](http://microbadger.com/images/smartfinn/python3:latest "Get your own image badge on microbadger.com") |
| xenial | 3.5.2  | ubuntu:xenial | [![](https://images.microbadger.com/badges/image/smartfinn/python3:xenial.svg)](http://microbadger.com/images/smartfinn/python3:xenial "Get your own image badge on microbadger.com") |
| alpine | 3.5.1  | alpine:latest | [![](https://images.microbadger.com/badges/image/smartfinn/python3:alpine.svg)](http://microbadger.com/images/smartfinn/python3:alpine "Get your own image badge on microbadger.com") |


Building from source
--------------------

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/python3/<tag>
make build
```

Usage
-----

#### Ubuntu based build

```dockerfile
FROM smartfinn/python3:xenial

ENV DEBIAN_FRONTEND=noninteractive

RUN BUILD_DEPS="build-essential python-all-dev" \
 && apt-get update \
 && apt-get install -y $BUILD_DEPS \
 && pip3 --no-cache-dir install <packages> \
 && apt-get purge -y $BUILD_DEPS \
 && apt-get autoremove -y \
 && rm -f /var/lib/apt/lists/*.*
```

#### Alpine based build

```dockerfile
FROM smartfinn/python3:alpine

RUN apk --no-cache add --virtual .build-deps build-base python-dev \
 && pip3 --no-cache-dir install <packages> \
 && apk --no-cache del .build-deps
```
