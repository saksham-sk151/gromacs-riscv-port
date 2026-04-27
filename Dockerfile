FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    gcc-riscv64-linux-gnu \
    g++-riscv64-linux-gnu \
    qemu-user-static \
    build-essential \
    git cmake python3 vim nano \
    && rm -rf /var/lib/apt/lists/*
ENV CROSS_COMPILE=riscv64-linux-gnu-
WORKDIR /workspace
