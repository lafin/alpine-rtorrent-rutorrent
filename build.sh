#!/bin/sh

ARCHS=( x86 x86_64 armhf )
for ARCH in "${ARCHS[@]}"
do
    docker run --rm --privileged multiarch/qemu-user-static:register --reset
    cp Dockerfile.stable origin.stable
    sed -ie "s/FROM alpine:3.3/FROM multiarch\/alpine:${ARCH}\-v3.3/" Dockerfile.stable
    docker build -t lafin/alpine-rtorrent-rutorrent:${ARCH}-stable -f Dockerfile.stable .
    mv origin.stable Dockerfile.stable

    docker run --rm --privileged multiarch/qemu-user-static:register --reset
    cp Dockerfile.latest origin.latest
    sed -ie "s/FROM alpine:3.3/FROM multiarch\/alpine:${ARCH}\-v3.3/" Dockerfile.latest
    docker build -t lafin/alpine-rtorrent-rutorrent:${ARCH}-latest -f Dockerfile.latest .
    mv origin.latest Dockerfile.latest
done
