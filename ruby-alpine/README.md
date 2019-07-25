# smartfinn/ruby-alpine

lightweight [Ruby](http://www.ruby-lang.org) Docker base images

## Versions

| Tag    | Ruby | Base image | Size |
|--------|------|------------|------|
| latest | [![Alpine Linux Edge package](https://repology.org/badge/version-only-for-repo/alpine_edge/ruby.svg)](https://repology.org/project/ruby/versions) | alpine:latest | [![](https://images.microbadger.com/badges/image/smartfinn/ruby-alpine:latest.svg)](http://microbadger.com/images/smartfinn/ruby-alpine:latest "Get your own image badge on microbadger.com") |

## Building from source

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/ruby-alpine/
make build
```

## Usage

```dockerfile
FROM smartfinn/ruby-alpine:latest

RUN apk --no-cache add --virtual .build-deps build-base ruby-dev \
 && gem install --no-rdoc --no-ri <packages> \
 && apk --no-cache del .build-deps
```
