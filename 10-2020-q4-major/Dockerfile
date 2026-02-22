ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04 AS downloader

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates wget bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O archive.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2?revision=ca0cbf9c-9de2-491c-ac48-898b5bbc0443&hash=B47BBB3CB50E721BC11083961C4DF5CA" && \
    echo 8312c4c91799885f222f663fc81f9a31 archive.tar.bz2 > /tmp/archive.md5 && md5sum -c /tmp/archive.md5 && rm /tmp/archive.md5 && \
    tar xf archive.tar.bz2 -C /opt && \
    rm archive.tar.bz2

FROM gcc-arm-embedded-base:latest

COPY --from=downloader /opt/gcc-arm-none-eabi-10-2020-q4-major /opt/gcc-arm-none-eabi-10-2020-q4-major

ENV PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH

WORKDIR /builds

USER builder
