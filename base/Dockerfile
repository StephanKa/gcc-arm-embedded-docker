ARG DEBIAN_FRONTEND=noninteractive

FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends make cmake zip curl wget git doxygen graphviz \
        python3 python3-pip python3-venv ninja-build \
        clang-18 clang-tidy-18 clang-format-18 llvm-18 lld-18 \
        gdb-multiarch openocd stlink-tools && \
    pip3 install --no-cache-dir --break-system-packages pyocd west intelhex cmsis-pack-manager && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /root/.cache/pip && \
    userdel -r ubuntu 2>/dev/null || true && \
    useradd -m -u 1000 -s /bin/bash builder

WORKDIR /builds

USER builder
