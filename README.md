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
$ docker -t obmcbuilder:latest .
```

#### download OpenBMC source code
```
$ git clone https://github.com/openbmc/openbmc.git
```

### launch docker for development
```
$ ./entrydocker
```

### for example
```
#
#  run under docker-obmc folder
#
$ ./entrydocker # launch docker image

#
# now into docker image environment
#
builder@dockerbmc:~/openbmc$ . setup romulus #
builder@dockerbmc:~/openbmc/build/romulus$ bitbake obmc-phosphor-image
```
