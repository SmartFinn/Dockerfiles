FROM ubuntu:xenial
LABEL maintainer SmartFinn

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    python3-pip python3-setuptools python3-wheel \
 && pip3 --no-cache-dir install --upgrade pip setuptools \
 && update-alternatives --install "/usr/bin/pdb" "pdb" "/usr/bin/pdb3" 5 \
 && update-alternatives --install "/usr/bin/pyclean" "pyclean" "/usr/bin/py3clean" 5 \
 && update-alternatives --install "/usr/bin/pycompile" "pycompile" "/usr/bin/py3compile" 5 \
 && update-alternatives --install "/usr/bin/pydoc" "pydoc" "/usr/bin/pydoc3" 5 \
 && update-alternatives --install "/usr/bin/pygettext" "pygettext" "/usr/bin/pygettext3" 5 \
 && update-alternatives --install "/usr/bin/python" "python" "/usr/bin/python3" 5 \
 && rm -f /var/lib/apt/lists/*.*

CMD ["python3"]
