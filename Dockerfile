FROM python:3.11.2-alpine3.17

# Upgrade to fix vulnerabilities
RUN apk --no-cache upgrade

# Install git
RUN apk --no-cache --update add git==2.38.3-r1 git-lfs==3.2.0-r3 less==608-r1 && \
    git lfs install && \
    rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*

# Install bash
RUN apk add --no-cache --upgrade bash==5.2.15-r0 && \
    rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*

# Install python packages
RUN apk --no-cache --update add libxml2-dev==2.10.3-r1 libxslt-dev==1.1.37-r0 libffi-dev==3.4.4-r0 build-base==0.5-r3 && \
    python3 -m pip install --no-cache-dir --upgrade pip==23.0 && \
    pip install --no-cache-dir pylint==2.16.1 && \
    pip install --no-cache-dir pip-audit==2.4.14 && \
    rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*

# Create non root user
RUN addgroup --system fll --gid 1000 && \
    adduser --system fll --ingroup fll --uid 1000

USER fll

# Launch test scripts
CMD ["/bin/bash"]