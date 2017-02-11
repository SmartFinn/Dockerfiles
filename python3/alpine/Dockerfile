FROM alpine:latest
LABEL maintainer SmartFinn

ENV LANG=C.UTF-8

RUN apk --no-cache add ca-certificates python3 \
 && pip3 --no-cache-dir install --upgrade pip setuptools \
 && ln -sf "/usr/bin/idle3" "/usr/bin/idle" \
 && ln -sf "/usr/bin/pydoc3" "/usr/bin/pydoc" \
 && ln -sf "/usr/bin/python3" "/usr/bin/python"

CMD ["python3"]
