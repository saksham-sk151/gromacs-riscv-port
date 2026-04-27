
# Build Instructions

## Prerequisites

- WSL2 or Linux system (x86_64)

- Docker installed

- 4GB RAM minimum

- 10GB disk space

## Step-by-Step Build

### 1. Clone Repository

```bash

git clone https://github.com/saksham-sk151/gromacs-riscv-port.git

cd gromacs-riscv-port

```

### 2. Run Build Script

```bash

./scripts/build-gromacs.sh

```

This script will:

- Pull Ubuntu 22.04 Docker image

- Install RISC-V cross-compiler

- Upgrade CMake to 3.28.3

- Clone GROMACS source

- Configure for RISC-V

- Build binaries

- Verify architecture

### 3. Verify Results

```bash

cd gromacs/build

file bin/gmx

readelf -h bin/gmx | grep Machine

```

Expected output:

bin/gmx: ELF 64-bit LSB pie executable, UCB RISC-V, RVC, double-float ABI Machine: RISC-V



## Manual Build (Advanced) 

See [PORTING_REPORT.md] for detailed manual build instructions.

