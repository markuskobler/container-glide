FROM golang:1.6-alpine

ENV VERSION 0.10.2

RUN \
   apk add -U git perl mercurial curl tar && \
   rm -rf /var/cache/apk/*

RUN \
    curl -L https://github.com/Masterminds/glide/releases/download/$VERSION/glide-$VERSION-linux-amd64.tar.gz | \
    tar -xz --strip-components=1 -C /usr/local/bin/ linux-amd64/glide

ENTRYPOINT [ "/usr/local/bin/glide" ]
WORKDIR /go/src
VOLUME  /go/src
