ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04 AS downloader

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget xz-utils && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O archive.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz" && \
    echo 62a63b981fe391a9cbad7ef51b17e49aeaa3e7b0d029b36ca1e9c3b2a9b78823 archive.tar.xz > /tmp/archive.sha256 && sha256sum -c /tmp/archive.sha256 && rm /tmp/archive.sha256 && \
    tar xf archive.tar.xz -C /opt && \
    rm archive.tar.xz

FROM gcc-arm-embedded-base:latest

COPY --from=downloader /opt/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi /opt/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi

ENV PATH=/opt/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/bin:$PATH

WORKDIR /builds

USER builder
