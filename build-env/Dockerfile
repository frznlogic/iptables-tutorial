FROM debian:bookworm-slim

LABEL version="0.1"
LABEL description="Build environment for iptables-tutorial"
LABEL maintainer="oan@frozentux.net"

ARG USERNAME
ARG USERID
ARG GROUPID

ENV USER=${USERNAME}
ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    netpbm \
    imagemagick \
    docbook \
    docbook-dsssl \
    docbook-website \
    docbook-xml \
    docbook-utils \
    texlive-font-utils \
    rsync \
    make \
    bash

# Fix for ImageMagick
RUN sed -i 's/domain=\"coder\" rights=\"none\"/domain=\"coder\" rights=\"read\|write\"/g' \
    /etc/ImageMagick-6/policy.xml

RUN groupadd -g ${GROUPID} ${USERNAME} \
    && useradd ${USERNAME} \
    --create-home \
    --uid ${USERID} \
    --gid ${GROUPID} \
    --shell=/bin/bash

USER ${USERNAME}

WORKDIR /home/${USERNAME}

CMD ["bash"]

