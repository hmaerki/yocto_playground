
FROM mcr.microsoft.com/devcontainers/base:bookworm

# https://github.com/crops/yocto-dockerfiles/blob/master/dockerfiles/debian/debian-12/debian-12-base/Dockerfile

RUN apt-get clean && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        chrpath \
        cpio \
        diffstat \
        file \
        fluxbox \
        gawk \
        git-core \
        locales \
        lz4 \
        procps \
        python3 \
        python3-pip \
        python3-virtualenv \
        screen \
        socat \
        subversion \
        sudo \
        sysstat \
        texinfo \
        tightvncserver \
        tmux \
        unzip \
        wget \
        xz-utils \
        zstd \
        gcc-multilib \
        g++-multilib

    # esac && \
    # cp -af /etc/skel/ /etc/vncskel/ && \
    # echo "export DISPLAY=1" >>/etc/vncskel/.bashrc && \
    # mkdir  /etc/vncskel/.vnc && \
    # echo "" | vncpasswd -f > /etc/vncskel/.vnc/passwd && \
    # chmod 0600 /etc/vncskel/.vnc/passwd && \
    # useradd -U -m yoctouser && \
    # echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen

# COPY build-install-dumb-init.sh  /
# RUN  bash /build-install-dumb-init.sh && \
#      rm /build-install-dumb-init.sh && \
#      apt-get clean

# USER yoctouser
# WORKDIR /home/yoctouser
# CMD /bin/bash

COPY ssh_config /home/vscode/.ssh/config
RUN chown -R 1000:1000 /home/vscode/.ssh
