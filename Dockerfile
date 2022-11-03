FROM python:3-alpine3.16

# Upgrade to fix vulnerabilities
RUN apk --no-cache upgrade

# Install git
RUN apk --no-cache --update add git==2.36.3-r0 git-lfs==3.1.4-r5 less==590-r0 && \
    git lfs install && \
    rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*

# Install bash
RUN apk add --no-cache --upgrade bash==5.1.16-r2 && \
    rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*

# Install python packages
RUN apk --no-cache --update add libxml2-dev==2.9.14-r2 libxslt-dev==1.1.35-r0 libffi-dev==3.4.2-r1 build-base==0.5-r3 && \
    python3 -m pip install --no-cache-dir --upgrade pip==22.3 && \
    pip install --no-cache-dir pylint==2.15.5 && \
    rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*

# Create non root user
RUN addgroup --system fll
RUN adduser --system fll --ingroup fll
USER fll

# Launch test scripts
CMD ["/bin/bash"]