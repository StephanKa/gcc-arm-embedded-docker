FROM ubuntu:24.04

RUN mkdir /builds && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make cmake zip curl wget git doxygen graphviz python3 python3-pip ninja-build && \
    wget -O archive.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz?rev=e434b9ea4afc4ed7998329566b764309&hash=CA590209F5774EE1C96E6450E14A3E26" && \
    echo 6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb archive.tar.xz > /tmp/archive.sha256 && sha256sum -c /tmp/archive.sha256 && rm /tmp/archive.sha256 && \
    tar xf archive.tar.xz -C /opt && \
    rm archive.tar.xz && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean

ENV PATH=/opt/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi/bin:$PATH

WORKDIR /builds
