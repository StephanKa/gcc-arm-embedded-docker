ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04 AS downloader

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O archive.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2?revision=108bd959-44bd-4619-9c19-26187abf5225&la=en&hash=E788CE92E5DFD64B2A8C246BBA91A249CB8E2D2D" && \
    echo fe0029de4f4ec43cf7008944e34ff8cc archive.tar.bz2 > /tmp/archive.md5 && md5sum -c /tmp/archive.md5 && rm /tmp/archive.md5 && \
    tar xf archive.tar.bz2 -C /opt && \
    rm archive.tar.bz2

FROM gcc-arm-embedded-base:latest

COPY --from=downloader /opt/gcc-arm-none-eabi-9-2019-q4-major /opt/gcc-arm-none-eabi-9-2019-q4-major

ENV PATH=/opt/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH

WORKDIR /builds

USER builder
