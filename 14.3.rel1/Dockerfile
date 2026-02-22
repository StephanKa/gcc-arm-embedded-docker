ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04 AS downloader

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget xz-utils && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O archive.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/14.3.rel1/binrel/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi.tar.xz" && \
    echo 8f6903f8ceb084d9227b9ef991490413014d991874a1e34074443c2a72b14dbd archive.tar.xz > /tmp/archive.sha256 && sha256sum -c /tmp/archive.sha256 && rm /tmp/archive.sha256 && \
    tar xf archive.tar.xz -C /opt && \
    rm archive.tar.xz

FROM gcc-arm-embedded-base:latest

COPY --from=downloader /opt/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi /opt/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi

ENV PATH=/opt/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi/bin:$PATH

WORKDIR /builds

USER builder
