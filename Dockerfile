FROM ubuntu:18.04
MAINTAINER sebastian.breuers@elfin.de

RUN apt-get update && apt-get install -y \
        git \
        diffstat \
        texinfo \
        gawk \
        chrpath \
        cpio \
        libsdl1.2-dev \
        git-crypt \
        locales \
        && apt-get clean \
        && locale-gen en_US.UTF-8

RUN useradd -u 1006 -s /bin/bash -U gitlab-runner -m

