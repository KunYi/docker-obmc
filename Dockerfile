# This image for OpenBMC build
FROM ubuntu:jammy

ARG TARGETPLATFORM
ARG DEBIAN_FRONTEND=noninteractive
ARG userid
ARG groupid
ARG username

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

RUN groupadd -g $groupid $username \
 && useradd -m -u $userid -g $groupid $username \
 && echo $username >/root/username

COPY gitconfig /home/$username/.gitconfig

RUN chown $userid:$groupid /home/$username/.gitconfig

ENV HOME=/home/$username
ENV USER=$username

WORKDIR $HOME

ENV HOME=/home/$username
ENV USER=$username
ENV WORKFOLDER=/home/$username/openbmc

ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -c "cd $WORKFOLDER && exec /bin/bash -i"

