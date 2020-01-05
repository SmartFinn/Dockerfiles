FROM alpine:latest
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV LANG=C.UTF-8

RUN apk --no-cache add ca-certificates python3 \
 && python3 -m pip --no-cache-dir install --upgrade pip setuptools \
 && ln -sf /usr/bin/pip3 /usr/bin/pip \
 && ln -sf /usr/bin/pydoc3 /usr/bin/pydoc \
 && ln -sf /usr/bin/python3 /usr/bin/python

CMD ["python3"]
