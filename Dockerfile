FROM debian:stable-slim
LABEL maintainer="alexey.miasoedov@gmail.com"

ARG OVFTOOL_VERSION=4.3.0-10104578

RUN apt-get update && apt-get install -y wget && \
    wget -nv https://raw.githubusercontent.com/akamac/binaries/master/VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle && \
    chmod +x VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle && \
    ./VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle --console --required --eulas-agreed && \
    apt-get remove --purge --autoremove -y wget && \
    rm -rf VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle /var/lib/apt/lists/*

ENTRYPOINT ["ovftool"]