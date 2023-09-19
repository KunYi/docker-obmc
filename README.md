docker-obmc
===

using docker for build OpenBMC image

### prepare
#### install docker engine
need install Docker Engine first, check [this article](https://docs.docker.com/engine/install/ubuntu/) if on Ubuntu platform.

#### configuration for none-root user
and check [this article](https://docs.docker.com/engine/install/linux-postinstall/) for non-root user

#### build docker image
```
$ git clone https://github.com/KunYi/docker-obmc.git  # clone this repository to local
$ cd docker-obmc
$ ./build-container
```

#### download OpenBMC source code of 2.14.0
```
$ git clone --single-branch --branch=2.14.0 https://github.com/openbmc/openbmc.git
```

### launch docker for development
```
$ ./entrycontainer
```

### for example
```
#
#  run under docker-obmc folder
#
$ ./entrycontainer # launch docker image
```
```
#
# now into docker image environment
#
builder@dockerbmc:~/openbmc$ mkdir build
builder@dockerbmc:~/openbmc$ . setup romulus build # create romulus build environments and configuration
builder@dockerbmc:~/openbmc/build/romulus$ bitbake obmc-phosphor-image  # build image now
```
