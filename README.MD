# Overview

[![Docker Image CI](https://github.com/StephanKa/gcc-arm-embedded-docker/actions/workflows/docker_image.yml/badge.svg)](https://github.com/StephanKa/gcc-arm-embedded-docker/actions/workflows/docker_image.yml)

This Docker contains tools for cross-compilation to ARM as well as the gcc [toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads) and cmake.

All images use **multistage builds** to separate the toolchain download/extraction from the final image, keeping image layers clean. Builds are non-interactive (`DEBIAN_FRONTEND=noninteractive`) and run as a non-root `builder` user (UID 1000).

A shared **base image** (`gcc-arm-embedded-base`) contains all common tooling. Every version-specific image is built `FROM gcc-arm-embedded-base:latest`, so the common layer only needs to be built once.

## Base Image

The `base/Dockerfile` defines the shared foundation for all version-specific images. It must be built locally before building any toolchain image.

```bash
docker build . --file base/Dockerfile -t gcc-arm-embedded-base:latest
```

All version-specific images reference it as:
```dockerfile
FROM gcc-arm-embedded-base:latest
```

The base image is based on `ubuntu:24.04` and includes all common tooling listed in the [Additional packages](#additional-packages) section below.

## Example

### Local
```bash
# 1. Build the shared base image (once)
docker build . --file base/Dockerfile -t gcc-arm-embedded-base:latest

# 2. Build a specific toolchain image
docker build . --file 12.3.rel1/Dockerfile -t gcc-arm-embedded:latest -t gcc-arm-embedded:12.3.rel1

# 3. Use the image
docker run --rm -u $(id -u):$(id -g) -v `pwd`/example:/builds gcc-arm-embedded cmake --preset debug
docker run --rm -u $(id -u):$(id -g) -v `pwd`/example:/builds gcc-arm-embedded cmake --build --preset debug
```

> **Note:** The container runs as `builder` (UID 1000). When mounting host volumes, pass `-u $(id -u):$(id -g)` to match the host user and avoid permission issues.

## Tag

### 15.2.Rel1 (December 17, 2025)
`arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 15.2
* Linux x86_64 Tarball
* SHA256: 597893282ac8c6ab1a4073977f2362990184599643b4c5ee34870a8215783a16

### 14.3.Rel1 (July 3, 2025)
`arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 14.3
* Linux x86_64 Tarball
* SHA256: 8f6903f8ceb084d9227b9ef991490413014d991874a1e34074443c2a72b14dbd

### 14.2.Rel1 (December 10, 2024)
`arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 14.2
* Linux x86_64 Tarball
* SHA256: 62a63b981fe391a9cbad7ef51b17e49aeaa3e7b0d029b36ca1e9c3b2a9b78823

### 13.3.Rel1 (July 4, 2024)
`arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 13.3
* Linux x86_64 Tarball
* SHA256: 95c011cee430e64dd6087c75c800f04b9c49832cc1000127a92a97f9c8d83af4

### 13.2.Rel1 (October 30, 2023)
`arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 13.2
* Linux x86_64 Tarball
* SHA256: 6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb

### 12.3.Rel1 (July 28, 2023)
`arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 12.3
* Linux x86_64 Tarball
* SHA256: 12a2815644318ebcceaf84beabb665d0924b6e79e21048452c5331a56332b309

### 12.2.Rel1 (December 22, 2022)
`arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 12.2
* Linux x86_64 Tarball
* SHA256: 84be93d0f9e96a15addd490b6e237f588c641c8afdf90e7610a628007fc96867

### 11.3.Rel1 (August 08, 2022)
`arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz`
* GCC 11.3
* Linux x86_64 Tarball
* SHA256: d420d87f68615d9163b99bbb62fe69e85132dc0a8cd69fca04e813597fe06121

### Old deprecated releases

### 10.3-2021.10 (October 21, 2021)
`gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2`
* GCC 10.3
* Linux x86_64 Tarball
* MD5: 2383e4eb4ea23f248d33adc70dc3227e

### 10.3-2021.07 (July 29, 2021)
`gcc-arm-none-eabi-10.3-2021.07-x86_64-linux.tar.bz2`
* GCC 10.3
* Linux x86_64 Tarball
* MD5: b56ae639d9183c340f065ae114a30202

### 10-2020-q4-major (December 11, 2020)
`gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2`
* GCC 10.2
* Linux x86_64 Tarball
* MD5: 8312c4c91799885f222f663fc81f9a31

### 9-2020-q2-update (June 30, 2020)
`gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2`
* GCC 9.3.1
* Linux x86_64 Tarball
* MD5: 2b9eeccc33470f9d3cda26983b9d2dc6

### 9-2019-q4-major (November 06, 2019)
`gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2`
* GCC 9.2
* Linux x86_64 Tarball
* MD5: fe0029de4f4ec43cf7008944e34ff8cc

### 8-2019-q3-update (July 10, 2019)
`gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2`
* GCC 8
* Linux 64-bit Tarball
* MD5: 6341f11972dac8de185646d0fbd73bfc

### 8-2018-q4-major
`gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2`
* GCC 8
* Linux 64-bit Tarball
* MD5: f55f90d483ddb3bcf4dae5882c2094cd

### 7-2018-q2-update
`gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2`
* Linux 64-bit Tarball
* MD5: 299ebd3f1c2c90930d28ab82e5d8d6c0 

### 7-2017-q4-major 
`gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2`
* Linux 64-bit Tarball
* MD5: d3b00ae09e847747ef11316a8b04989a

### 6-2017-q2-update 
`gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2`
* Linux 64-bit Tarball
* MD5: 13747255194398ee08b3ba42e40e9465

## Additional packages

All packages below are installed in the shared **base image** (`base/Dockerfile`) and are therefore available in every toolchain image.

### Build tools
* make
* cmake
* ninja-build
* zip
* wget
* curl
* git

### Documentation
* doxygen
* graphviz

### Python
* python3
* python3-pip
* python3-venv
* pyocd *(pip)*
* west *(pip — Zephyr RTOS meta-tool)*
* intelhex *(pip)*
* cmsis-pack-manager *(pip)*

### LLVM / Clang (versioned, Ubuntu 24.04 default: 18)
* clang-18
* clang-tidy-18
* clang-format-18
* llvm-18
* lld-18

### Embedded debug & flash
* gdb-multiarch
* openocd
* stlink-tools
