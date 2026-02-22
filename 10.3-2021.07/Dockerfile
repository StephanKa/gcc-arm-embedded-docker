ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04 AS downloader

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates wget bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O archive.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2" && \
    echo 2383e4eb4ea23f248d33adc70dc3227e archive.tar.bz2 > /tmp/archive.md5 && md5sum -c /tmp/archive.md5 && rm /tmp/archive.md5 && \
    tar xf archive.tar.bz2 -C /opt && \
    rm archive.tar.bz2

FROM gcc-arm-embedded-base:latest

COPY --from=downloader /opt/gcc-arm-none-eabi-10.3-2021.10 /opt/gcc-arm-none-eabi-10.3-2021.10

ENV PATH=/opt/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH

WORKDIR /builds

USER builder
