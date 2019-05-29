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
        gcc-multilib \
        gcc-6 \
        curl \
        python \
        wget \
        && apt-get clean \
        && locale-gen en_US.UTF-8

RUN useradd -u 1006 -s /bin/bash -U gitlab-runner -m
RUN su gitlab-runner -c "git config --global user.email 'gitlab-runner-watson@elfin.de'" && \
    su gitlab-runner -c "git config --global user.name 'Gitlab Runner Watson'"



