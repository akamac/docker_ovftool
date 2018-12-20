FROM ubuntu:latest
LABEL maintainer="alexey.miasoedov@gmail.com"

ARG OVFTOOL_VERSION=4.3.0-10104578

RUN wget -nv https://raw.githubusercontent.com/akamac/ovftool_docker/master/VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle && \
    VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle --console --required --eulas-agreed && \
    rm -f VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle

ENTRYPOINT ["ovftool"]