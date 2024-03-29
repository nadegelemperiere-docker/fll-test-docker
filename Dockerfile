FROM ubuntu:23.04

# Update systemd
RUN apt-get update && \
    apt-get install --no-install-recommends -y systemd=252.5-2ubuntu3 && \
    rm -rf /var/lib/apt/lists/*

# Install curl
RUN apt-get update && \
    apt-get install --no-install-recommends -y curl=7.88.1-6ubuntu1 && \
    apt-get install --no-install-recommends -y unzip=6.0-27ubuntu1 && \
    rm -rf /var/lib/apt/lists/*

# Install glibc
RUN apt-get update && \
    apt-get install --no-install-recommends -y glibc-source=2.37-0ubuntu1 && \
    rm -rf /var/lib/apt/lists/*

# Install git
RUN apt-get update && \
    apt-get install --no-install-recommends -y git=1:2.39.2-1ubuntu1 && \
    apt-get install --no-install-recommends -y less=590-1.2 && \
    apt-get install --no-install-recommends -y git-lfs=3.3.0-1 && \
    rm -rf /var/lib/apt/lists/*

# Install bash
RUN apt-get update && \
    apt-get install --no-install-recommends -y bash=5.2.15-2ubuntu1 && \
    rm -rf /var/lib/apt/lists/*

# Install python
RUN apt-get update && \
    apt-get install --no-install-recommends -y python3-pip=23.0.1+dfsg-1 && \
    apt-get install --no-install-recommends -y python3-venv=3.11.2-1 && \
    apt-get install --no-install-recommends -y python3-pytest-pylint=0.19.0-1 && \
    apt-get install --no-install-recommends -y python3-sphinx=5.3.0-3 && \
    apt-get install --no-install-recommends -y libxml2-dev=2.9.14+dfsg-1.1build2 && \
    apt-get install --no-install-recommends -y libxslt1-dev=1.1.35-1 && \
    apt-get install --no-install-recommends -y libffi-dev=3.4.4-1 && \
    curl -sSL https://install.python-poetry.org -o get_poetry.py && \
    export POETRY_HOME=/usr/local && \
    python3 get_poetry.py --version 1.4.1 && \
    python3 -m pip install --no-cache-dir --break-system-packages pip-audit==2.5.1 && \
    python3 -m pip install --no-cache-dir --break-system-packages poetry-dynamic-versioning==0.21.4 && \
    rm -rf /var/lib/apt/lists/*

# Correcting localtime path
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/UTC /etc/localtime

# Create non root user
RUN userdel ubuntu && \
    groupadd  --gid 1000 fll  && \
    useradd  -m --gid 1000 --uid 1000 fll && \
    mkdir /fll && \
    chmod 777 -R /fll

USER fll

# Launch test scripts
CMD ["/bin/bash"]