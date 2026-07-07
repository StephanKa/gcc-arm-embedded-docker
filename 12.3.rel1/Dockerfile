ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04 AS downloader

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates wget xz-utils && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O archive.tar.xz "https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/12.3.rel1/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz" && \
    echo 12a2815644318ebcceaf84beabb665d0924b6e79e21048452c5331a56332b309 archive.tar.xz > /tmp/archive.sha256 && sha256sum -c /tmp/archive.sha256 && rm /tmp/archive.sha256 && \
    tar xf archive.tar.xz -C /opt && \
    rm archive.tar.xz

FROM gcc-arm-embedded-base:latest

COPY --from=downloader /opt/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi /opt/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi

ENV PATH=/opt/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi/bin:$PATH

WORKDIR /builds

USER builder
