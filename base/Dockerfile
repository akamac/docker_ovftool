FROM ubuntu:latest

ARG OVFTOOL_VERSION=4.3.0-10104578

RUN apt-get update && apt-get install -y wget
RUN wget -nv https://raw.githubusercontent.com/akamac/binaries/master/VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle
RUN chmod +x VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle
RUN ./VMware-ovftool-${OVFTOOL_VERSION}-lin.x86_64.bundle --console --required --eulas-agreed