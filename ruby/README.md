# smartfinn/ruby

lightweight [Ruby](http://www.ruby-lang.org) Docker base images

## Versions

| Tag    | Ruby   | Base image    | Size |
|--------|--------|---------------|------|
| latest | 2.3.1  | ubuntu:xenial | [![](https://images.microbadger.com/badges/image/smartfinn/ruby:latest.svg)](http://microbadger.com/images/smartfinn/ruby:latest "Get your own image badge on microbadger.com") |
| xenial | 2.3.1  | ubuntu:xenial | [![](https://images.microbadger.com/badges/image/smartfinn/ruby:xenial.svg)](http://microbadger.com/images/smartfinn/ruby:xenial "Get your own image badge on microbadger.com") |
| alpine | 2.3.1  | alpine:latest | [![](https://images.microbadger.com/badges/image/smartfinn/ruby:alpine.svg)](http://microbadger.com/images/smartfinn/ruby:alpine "Get your own image badge on microbadger.com") |

## Building from source

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/ruby/<tag>
make build
```

## Usage

#### Ubuntu based build

```dockerfile
FROM smartfinn/ruby:xenial

ENV DEBIAN_FRONTEND=noninteractive

RUN BUILD_DEPS="build-essential ruby-dev" \
 && apt-get update \
 && apt-get install -y $BUILD_DEPS \
 && gem install --no-rdoc --no-ri <packages> \
 && apt-get purge -y --auto-remove $BUILD_DEPS \
 && rm -f /var/lib/apt/lists/*.*
```

#### Alpine based build

```dockerfile
FROM smartfinn/ruby:alpine

RUN apk --no-cache add --virtual .build-deps build-base ruby-dev \
 && gem install --no-rdoc --no-ri <packages> \
 && apk --no-cache del .build-deps
```
