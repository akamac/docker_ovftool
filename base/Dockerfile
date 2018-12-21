FROM ubuntu:latest

ARG OVFTOOL_VERSION=4.3.0-10104578

ADD https://raw.githubusercontent.com/akamac/binaries/master/VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle .
RUN chmod +x VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle
RUN ./VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle --console --required --eulas-agreed