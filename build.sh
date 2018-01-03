#!/bin/sh

ARCHS=( x86_64 armhf )
for ARCH in "${ARCHS[@]}"
do
    docker run --rm --privileged multiarch/qemu-user-static:register --reset
    cp Dockerfile.stable origin.stable
    sed -ie "s/FROM alpine:3.7/FROM multiarch\/alpine:${ARCH}\-v3.7/" Dockerfile.stable
    docker build -t lafin/alpine-rtorrent-rutorrent:${ARCH}-stable -f Dockerfile.stable .
    mv origin.stable Dockerfile.stable
    rm Dockerfile.stablee

    docker run --rm --privileged multiarch/qemu-user-static:register --reset
    cp Dockerfile.latest origin.latest
    sed -ie "s/FROM alpine:3.7/FROM multiarch\/alpine:${ARCH}\-v3.7/" Dockerfile.latest
    docker build -t lafin/alpine-rtorrent-rutorrent:${ARCH}-latest -f Dockerfile.latest .
    mv origin.latest Dockerfile.latest
    rm Dockerfile.lateste
done
