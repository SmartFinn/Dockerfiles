smartfinn/nginx
===============

lightweight [NGINX](https://www.nginx.com/) Docker image


Versions
--------

| Tag    | Nginx  | Base image    | Virtual size |
|--------|--------|---------------|--------------|
| latest | 1.10.0 | alpine:latest |        22 MB |


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
