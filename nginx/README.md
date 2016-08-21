smartfinn/nginx
===============

lightweight [NGINX](https://www.nginx.com/) Docker image


Versions
--------

| Tag    | Nginx  | Base image    | Size                                                                                                                                                                              |
|--------|--------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| latest | 1.10.1 | alpine:latest | [![](https://images.microbadger.com/badges/image/smartfinn/nginx:latest.svg)](http://microbadger.com/images/smartfinn/nginx:latest "Get your own image badge on microbadger.com") |


Building from source
--------------------

```sh
git clone https://github.com/SmartFinn/Dockerfiles.git
cd Dockerfiles/nginx
make build
```


Usage
-----

```sh
make run
```
or
```
mkdir -p ~/html
docker-compose up -d
```
