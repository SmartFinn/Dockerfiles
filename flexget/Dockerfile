FROM python:3 AS builder

RUN python3 -m venv /app

ENV PATH="/app/bin:$PATH" \
    VIRTUAL_ENV="/app"

RUN python3 -m pip --no-cache-dir install flexget transmission-rpc

FROM python:3-slim
LABEL maintainer "SmartFinn (https://github.com/SmartFinn)"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/app/bin:$PATH" \
    VIRTUAL_ENV="/app"

COPY --from=builder /app /app
COPY rootfs/ /

WORKDIR /config

RUN touch /config/config.yml \
 && chown -R nobody:nogroup /config

USER nobody

EXPOSE 3539

VOLUME ["/config"]

ENTRYPOINT ["/entrypoint.sh"]
