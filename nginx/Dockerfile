FROM alpine:edge
MAINTAINER Sergei Eremenko <https://github.com/SmartFinn>

RUN apk --no-cache add nginx gettext \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

VOLUME ["/etc/nginx/conf.d/", "/usr/share/nginx/html"]

CMD ["nginx", "-g", "daemon off;"]
