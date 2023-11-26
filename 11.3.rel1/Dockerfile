FROM ubuntu:23.04

RUN mkdir /builds && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make cmake zip curl wget git doxygen graphviz python3 python3-pip ninja-build && \
    wget -O archive.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz?rev=95edb5e17b9d43f28c74ce824f9c6f10&hash=D5ACE3A6F75F603551D7702E00ED7B29" && \
    echo d420d87f68615d9163b99bbb62fe69e85132dc0a8cd69fca04e813597fe06121 archive.tar.xz > /tmp/archive.sha256 && sha256sum -c /tmp/archive.sha256 && rm /tmp/archive.sha256 && \
    tar xf archive.tar.xz -C /opt && \
    rm archive.tar.xz && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean

ENV PATH=/opt/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi/bin:$PATH

WORKDIR /builds
