#Run this after building the plugins (output goes to the bin directory)
FROM alpine:latest as build

COPY plugins /build/plugins
COPY pkg /build/pkg
COPY vendor /build/vendor
COPY go.mod /build/
COPY go.sum /build/
COPY build_linux.sh /build/

RUN apk update && apk add bash go

WORKDIR /build
RUN ./build_linux.sh

FROM alpine:latest
RUN apk add bash
COPY --from=build /build/bin/dhcp ./
