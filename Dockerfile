#Run this after building the plugins (output goes to the bin directory)
FROM alpine:latest

COPY plugins /build/plugins
COPY pkg /build/pkg
COPY vendor /build/vendor
COPY go.mod /build/
COPY go.sum /build/
COPY build_linux.sh /build/

RUN apk update && apk add bash tree go

WORKDIR /build
RUN ./build_linux.sh

WORKDIR /
RUN cp /build/bin/dhcp dhcp

RUN apk del go
RUN rm -fr /build
