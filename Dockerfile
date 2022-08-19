# This image for OpenBMC build
FROM ubuntu:bionic

ARG TARGETPLATFORM
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US:
RUN apt-get update && \
    apt-get install -y locales && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt-get install --no-install-recommends -y \
        gawk wget git-core diffstat unzip texinfo \
        gcc build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
        pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool \
	python3-distutils \
        python3-setuptools python3-wheel python3-yaml python3-distro python3-jsonschema python3-newt \
        gosu lsb-release file vim less procps tree tar bzip2 pigz bc tmux libncurses-dev \
        dosfstools mtools parted \
        git-lfs mercurial iproute2 ssh-client telnet curl rsync gnupg awscli sudo && \
    if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        apt-get install --no-install-recommends -y gcc-multilib g++-multilib syslinux; \
    fi && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd --create-home --no-log-init --shell /bin/bash builder
USER builder
WORKDIR /home/builder
