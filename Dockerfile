FROM ubuntu:22.04

# Update systemd
RUN apt-get update && \
    apt-get install --no-install-recommends -y systemd=249.11-0ubuntu3.7 && \
    rm -rf /var/lib/apt/lists/*

# Install glibc
RUN apt-get update && \
    apt-get install --no-install-recommends -y glibc-source=2.35-0ubuntu3.1 && \
    rm -rf /var/lib/apt/lists/*

# Install git
RUN apt-get update && \
    apt-get install --no-install-recommends -y git=1:2.34.1-1ubuntu1.8 && \
    apt-get install --no-install-recommends -y less=590-1ubuntu0.22.04.1 && \
    apt-get install --no-install-recommends -y git-lfs=3.0.2-1ubuntu0.1 && \
    apt-get install --no-install-recommends -y curl=7.81.0-1ubuntu1.8 && \
    apt-get install --no-install-recommends --reinstall -y ca-certificates=20211016ubuntu0.22.04.1 && \
    rm -rf /var/lib/apt/lists/*

# Install bash
RUN apt-get update && \
    apt-get install --no-install-recommends -y bash=5.1-6ubuntu1 && \
    rm -rf /var/lib/apt/lists/*

# Install python
RUN apt-get update && \
    apt-get autoremove -y python3.10 && \
    apt-get install --no-install-recommends -y python3.11=3.11.0~rc1-1~22.04 && \
    curl -sSL https://bootstrap.pypa.io/pip/get-pip.py -o get-pip.py && \
    python3.11 get-pip.py && \
    ln -s /usr/bin/python3.11 /usr/bin/python3 && \
    ln -s /usr/bin/python3.11 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

# Install python packages
RUN apt-get update && \
    apt-get install --no-install-recommends -y libxml2-dev=2.9.13+dfsg-1ubuntu0.2 libxslt1-dev=1.1.34-4ubuntu0.22.04.1 libffi-dev=3.4.2-4 && \
    python3.11 -m pip install --no-cache-dir --upgrade pip==23.0.1 && \
    pip install --no-cache-dir pylint==2.17.0 && \
    pip install --no-cache-dir pip-audit==2.4.14 && \
    pip install --no-cache-dir setuptools==67.6.0 && \
    rm -rf /var/lib/apt/lists/*

# Remove unnecessary packages
RUN apt-get update && \
    apt-get autoremove -y curl ca-certificates && \
    rm get-pip.py && \
    rm -rf /var/lib/apt/lists/*

# Create non root user
RUN addgroup --system fll --gid 1000 && \
    adduser --system fll --ingroup fll --uid 1000

USER fll

# Launch test scripts
CMD ["/bin/bash"]