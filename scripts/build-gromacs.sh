#!/bin/bash
# GROMACS RISC-V Build Script
# Author: Saksham Khalkho
# Date: April 2026

set -e

echo "========================================="
echo "GROMACS RISC-V Cross-Compilation Script"
echo "========================================="
echo ""

# Check if running in correct directory
if [ ! -d "gromacs" ]; then
    echo "Cloning GROMACS..."
    git clone https://gitlab.com/gromacs/gromacs.git
fi

# Start Docker container
echo "Starting Docker container..."
docker run -it --rm \
    -v $(pwd):/workspace \
    --memory="4g" \
    --cpus="3" \
    --name riscv-gromacs-build \
    ubuntu:22.04 /bin/bash -c '

# Install dependencies
apt update && apt install -y \
    gcc-riscv64-linux-gnu \
    g++-riscv64-linux-gnu \
    build-essential \
    git \
    wget \
    file

# Install CMake 3.28
cd /tmp
wget -q https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3-linux-x86_64.sh
chmod +x cmake-3.28.3-linux-x86_64.sh
./cmake-3.28.3-linux-x86_64.sh --skip-license --prefix=/usr/local
ln -sf /usr/local/bin/cmake /usr/bin/cmake

# Build GROMACS
cd /workspace/gromacs
mkdir -p build && cd build

echo "Configuring GROMACS for RISC-V..."
cmake .. \
  -DCMAKE_C_COMPILER=riscv64-linux-gnu-gcc \
  -DCMAKE_CXX_COMPILER=riscv64-linux-gnu-g++ \
  -DCMAKE_SYSTEM_NAME=Linux \
  -DCMAKE_SYSTEM_PROCESSOR=riscv64 \
  -DGMX_BUILD_OWN_FFTW=OFF \
  -DGMX_FFT_LIBRARY=fftpack \
  -DGMX_GPU=OFF \
  -DGMX_MPI=OFF \
  -DGMX_OPENMP=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CROSSCOMPILING=TRUE

echo "Building GROMACS..."
make -j2

echo "Verifying binaries..."
file bin/gmx
readelf -h bin/gmx | grep Machine

echo ""
echo "========================================="
echo "Build completed successfully!"
echo "========================================="
'
