# smartfinn/nginx

lightweight [NGINX](https://www.nginx.com/) Docker image

## Versions

| Tag    | Nginx  | Base image    | Size |
|--------|--------|---------------|------|
| latest | [![Alpine Linux Edge package](https://repology.org/badge/version-only-for-repo/alpine_edge/nginx.svg)](https://repology.org/project/nginx/versions) | alpine:latest | [![](https://images.microbadger.com/badges/image/smartfinn/nginx.svg)](https://microbadger.com/images/smartfinn/nginx "Get your own image badge on microbadger.com") |

## Building from source

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/nginx
make build
```

## Usage

```sh
make run
```

or

```sh
mkdir -p ~/html
docker-compose up -d
```
