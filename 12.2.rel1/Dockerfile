FROM ubuntu:24.04

RUN mkdir /builds && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make cmake zip curl wget git doxygen graphviz python3 python3-pip ninja-build && \
    wget -O archive.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz?rev=7bd049b7a3034e64885fa1a71c12f91d&hash=732D909FA8F68C0E1D0D17D08E057619" && \
    echo 84be93d0f9e96a15addd490b6e237f588c641c8afdf90e7610a628007fc96867 archive.tar.xz > /tmp/archive.sha256 && sha256sum -c /tmp/archive.sha256 && rm /tmp/archive.sha256 && \
    tar xf archive.tar.xz -C /opt && \
    rm archive.tar.xz && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean

ENV PATH=/opt/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi/bin:$PATH

WORKDIR /builds
