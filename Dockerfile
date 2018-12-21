FROM gcr.io/makisu-project/makisu:v0.1.6 as makisu

COPY base/Dockerfile context
RUN ["/makisu-internal/makisu", "build", "--compression=speed", "--dest=/makisu-storage/layers.tar", "--modifyfs=true", "-t=layers", "/context"]



FROM alpine:latest as layer

RUN apt-get update && apt-get install -y jq

WORKDIR /tmp
COPY --from=makisu /makisu-storage/layers.tar .
# RUN tar xf layers.tar # COPY does untar
RUN tar xf $(jq '.[0].Layers[-1]' manifest.json)
RUN tar czf ovftool.tar.gz /etc/vmware-vix /etc/vmware /usr/lib/vmware-ovftool/



FROM ubuntu:latest
LABEL maintainer="alexey.miasoedov@gmail.com"

COPY --from=layer /tmp/ovftool.tar.gz .

ENTRYPOINT ["/usr/lib/vmware-ovftool/ovftool"]
CMD ["--help"]