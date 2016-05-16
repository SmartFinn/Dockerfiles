smartfinn/ruby
==============

lightweight [Ruby](http://www.ruby-lang.org) Docker base images


Versions
--------

| Tag    | Ruby   | Base image    | Virtual size |
|--------|--------|---------------|--------------|
| latest | 2.3.0  | ubuntu:xenial |       157 MB |
| xenial | 2.3.0  | ubuntu:xenial |       157 MB |
| alpine | 2.2.4  | alpine:latest |        21 MB |


Building from source
--------------------

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/ruby/<tag>
make build
```

Usage
-----

#### Ubuntu based build

```dockerfile
FROM smartfinn/ruby:xenial

ENV DEBIAN_FRONTEND=noninteractive

RUN BUILD_DEPS="build-essential ruby-dev" \
 && apt-get update \
 && apt-get install -y $BUILD_DEPS \
 && gem install --no-rdoc --no-ri <packages> \
 && apt-get purge -y $BUILD_DEPS \
 && apt-get autoremove -y \
 && rm -f /var/lib/apt/lists/*.*
```

#### Alpine based build

```dockerfile
FROM smartfinn/ruby:alpine

RUN apk --no-cache add --virtual .build-deps build-base ruby-dev \
 && gem install --no-rdoc --no-ri <packages> \
 && apk --no-cache del .build-deps
```
