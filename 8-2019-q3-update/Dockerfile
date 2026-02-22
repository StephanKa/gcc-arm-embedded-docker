ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04 AS downloader

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates wget bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O archive.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2?revision=c34d758a-be0c-476e-a2de-af8c6e16a8a2?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,8-2019-q3-update" && \
    echo 6341f11972dac8de185646d0fbd73bfc archive.tar.bz2 > /tmp/archive.md5 && md5sum -c /tmp/archive.md5 && rm /tmp/archive.md5 && \
    tar xf archive.tar.bz2 -C /opt && \
    rm archive.tar.bz2

FROM gcc-arm-embedded-base:latest

COPY --from=downloader /opt/gcc-arm-none-eabi-8-2019-q3-update /opt/gcc-arm-none-eabi-8-2019-q3-update

ENV PATH=/opt/gcc-arm-none-eabi-8-2019-q3-update/bin:$PATH

WORKDIR /builds

USER builder
