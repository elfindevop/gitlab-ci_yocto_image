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
        gcc-6 \
        gcc-6-multilib \
        git \
        git-crypt \
        libsdl1.2-dev \
        locales \
        python \
        wget \
        rsync \
        librsvg2-2 \
        librsvg2-common \
        && apt-get clean

RUN locale-gen en_US.UTF-8

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10; \
        update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 20; \
        update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10; \
        update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 20; \
        update-alternatives --install /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc /usr/bin/gcc-7 10; \
        update-alternatives --install /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc /usr/bin/gcc-6 20; \
        update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30; \
        update-alternatives --set cc /usr/bin/gcc; \
        update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30; \
        update-alternatives --set c++ /usr/bin/g++

RUN dpkg --add-architecture i386 && \
        apt-get update \
        && apt-get install -y --no-install-recommends \
            cmake \
            libssl-dev \
            libboost-system1.65-dev \
            liblzo2-dev:i386 \
            liblzo2-dev:amd64 \
            uuid-dev:i386 \
            uuid-dev:amd64 \
            libusb-1.0-0-dev:i386 \
            libusb-1.0-0-dev:amd64 \
            libusb-1.0-0:i386 \
            libusb-1.0-0:amd64 \
            libc6-dev-i386 \
            gcc-8-base:i386 \
            lib32z1 \
            lib32z1-dev \
            libc6:i386 \
            libc6-dev:i386 \
            libc6-dev-i386 \
            libgcc1:i386 \
            libgcc-6-dev:i386 \
            linux-libc-dev \
            linux-libc-dev:i386 \
        && apt-get clean \
        && ldconfig

RUN useradd -u 1006 -s /bin/bash -U gitlab-runner -m
RUN su gitlab-runner -c "git config --global user.email 'gitlab-runner-watson@elfin.de'" && \
    su gitlab-runner -c "git config --global user.name 'Gitlab Runner Watson'"



