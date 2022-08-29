# This image for OpenBMC build
FROM ubuntu:bionic

ARG TARGETPLATFORM
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && \
    apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN apt install -yy build-essential chrpath cpio \
        debianutils diffstat file gawk git iputils-ping \
        libdata-dumper-simple-perl liblz4-tool libsdl1.2-dev libthread-queue-any-perl \
        python3 socat subversion texinfo wget zstd git-lfs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd --create-home --no-log-init --shell /bin/bash builder
USER builder
WORKDIR /home/builder
