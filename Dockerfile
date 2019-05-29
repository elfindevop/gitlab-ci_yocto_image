FROM ubuntu:18.04
MAINTAINER sebastian.breuers@elfin.de

RUN apt-get update && apt-get install -y \
        chrpath \
        cpio \
        curl \
        diffstat \
        texinfo \
        gawk \
        g++-6 \
        gcc-multilib \
        gcc-6 \
        git \
        git-crypt \
        libsdl1.2-dev \
        locales \
        python \
        wget \
        && apt-get clean

RUN locale-gen en_US.UTF-8

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10 \
        update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 20 \
        update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10 \
        update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 20 \
        update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30 \
        update-alternatives --set cc /usr/bin/gcc \
        update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30 \
        update-alternatives --set c++ /usr/bin/g++

RUN useradd -u 1006 -s /bin/bash -U gitlab-runner -m
RUN su gitlab-runner -c "git config --global user.email 'gitlab-runner-watson@elfin.de'" && \
    su gitlab-runner -c "git config --global user.name 'Gitlab Runner Watson'"



