FROM smartfinn/python:xenial
MAINTAINER SmartFinn <https://github.com/SmartFinn>

ENV DEBIAN_FRONTEND=noninteractive

RUN BUILD_DEPS="git-core" \
 && apt-get update \
 && apt-get install -y $BUILD_DEPS \
 && apt-get install -y --no-install-recommends libsasl2-modules \
    python-libvirt python-libxml2 supervisor websockify \
 && git clone https://github.com/retspen/webvirtmgr.git /app \
 && cd /app \
 && pip --no-cache-dir install -r requirements.txt \
 && cp webvirtmgr/local/local_settings.py.example \
    webvirtmgr/local/local_settings.py \
 && python /app/manage.py collectstatic --noinput \
 && sed -i 's/127.0.0.1/0.0.0.0/g' /app/conf/gunicorn.conf.py \
 && python /app/manage.py syncdb --noinput \
 && echo "from django.contrib.auth.models import User; \
    User.objects.create_superuser('admin', 'admin@localhost.localdomain', \
    'admin')" | python /app/manage.py shell \
 && chown -R nobody:nogroup /app \
 && apt-get purge -y $BUILD_DEPS \
 && apt-get autoremove -y \
 && rm -f /var/lib/apt/lists/*.*

COPY supervisor.webvirtmgr.conf /etc/supervisor/conf.d/webvirtmgr.conf

VOLUME ["/var/lib/libvirt", "/var/run/libvirt/libvirt-sock"]

EXPOSE 6080 8000

ENTRYPOINT supervisord --nodaemon
