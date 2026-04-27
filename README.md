# RISC-V HPC Application Porting

**GROMACS molecular dynamics software successfully ported to RISC-V 64-bit architecture**

Prepared for **LFX Mentorship 2026 Summer - Broadening the RISC-V High Precision Code Base and Reach**



## 🎯 Project Overview

This repository contains my preparation work for the LFX Mentorship program focused on porting ~400 HPC and AI/ML applications to RISC-V architecture.

**Project**: Broadening the RISC-V High Precision Code Base and Reach

## ✅ What I've Accomplished

- ✅ Set up complete RISC-V cross-compilation development environment
- ✅ Successfully ported GROMACS to RISC-V 64-bit (370,000+ lines of code)
- ✅ Resolved build challenges (CMake upgrade, FFTW cross-compilation)
- ✅ Analyzed all 371 applications in project scope
- ✅ Created comprehensive technical documentation

## 📁 Repository Contents

lfx-riscv-2026/
├── README.md                          # This file
├── Dockerfile                         # RISC-V development environment
├── GROMACS_PORTING_REPORT.md          # Complete porting documentation
├── GROMACS_DEPENDENCIES.md            # Dependency analysis
├── BUILD_INSTRUCTIONS.md              # GROMACS Build instructions
├── scripts                            # GROMACS Build script
│   └── build-gromacs.sh               # Build script 
├── gromacs/                           # GROMACS source code
│   └── build/                         # Build directory
│       └── bin/                       # RISC-V binaries (gmx, etc.)
├── evidence/                          # SUCCESSFUL Build evidence
│   └── build-verification.txt         # evidence
├── hello.c                            # First RISC-V test program
├── hello-riscv                        # RISC-V binary
├── hpc_test.c                         # HPC double-precision test
└── hpc_test                           # RISC-V binary

## 🔬 Binary Verification

```bash
$ file gromacs/build/bin/gmx
bin/gmx: ELF 64-bit LSB pie executable, UCB RISC-V, RVC, 
         double-float ABI, version 1 (SYSV), dynamically linked

$ readelf -h gromacs/build/bin/gmx | grep Machine
  Machine:                           RISC-V
```

**Confirmed**: RISC-V 64-bit executable with hardware double-precision floating-point support!

## 🚀 Quick Start

### Prerequisites
- WSL2 or Linux system
- Docker installed
- 4GB+ RAM

### Build GROMACS for RISC-V

```bash
# Clone this repository
git clone https://github.com/saksham-sk151/gromacs-riscv-port.git
cd gromacs-riscv-port

# Build Docker image
docker build -t riscv-dev .

# Run container
docker run -it --rm -v $(pwd):/workspace --memory="4g" riscv-dev

# Inside container - verify RISC-V toolchain
riscv64-linux-gnu-gcc --version

# Test simple programs
qemu-riscv64-static hello-riscv
qemu-riscv64-static hpc_test
```

## 📊 GROMACS Porting Highlights

### Challenges Overcome

1. **CMake Version Conflict**
   - Required: 3.28+
   - System: 3.22.1
   - Solution: Manual upgrade to 3.28.3

2. **FFTW Cross-Compilation**
   - Issue: Configure script couldn't run RISC-V binaries
   - Solution: Switched to built-in fftpack library

3. **Architecture Detection**
   - Issue: x86 SIMD detection failed
   - Solution: Disabled SIMD, used portable code paths

### Build Configuration

```cmake
cmake .. \
  -DCMAKE_C_COMPILER=riscv64-linux-gnu-gcc \
  -DCMAKE_CXX_COMPILER=riscv64-linux-gnu-g++ \
  -DCMAKE_SYSTEM_NAME=Linux \
  -DCMAKE_SYSTEM_PROCESSOR=riscv64 \
  -DGMX_FFT_LIBRARY=fftpack \
  -DGMX_GPU=OFF \
  -DCMAKE_CROSSCOMPILING=TRUE
```

## 📈 Results

| Metric | Value |
|--------|-------|
| Build Status | ✅ 100% Success |
| Lines of Code | 370,000+ |
| Build Time | ~15-20 minutes |
| Binaries Created | 3 (gmx + test programs) |
| Architecture | RISC-V 64-bit (rv64gc) |

## 📚 Documentation

- **[GROMACS_PORTING_REPORT.md](GROMACS_PORTING_REPORT.md)** - Complete technical report with methodology, challenges, and solutions
- **[GROMACS_DEPENDENCIES.md](GROMACS_DEPENDENCIES.md)** - Dependency analysis and porting strategy
- **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** - Basic build instructions

## 🎓 Skills Demonstrated

- Cross-compilation for RISC-V architecture
- CMake build system configuration
- Dependency management and resolution
- Docker containerization
- Problem-solving for architecture-specific issues
- Technical documentation
- HPC application analysis

## 🔗 Project Context

LFX Mentorship program:
- **Project**: Broadening the RISC-V High Precision Code Base and Reach
- **Organization**: RISC-V 
- **Scope**: Port ~400 AI/ML and HPC applications to RISC-V
- **Code List**: [Project Spreadsheet](https://tinyurl.com/4v22ujvt)


------------------------------------------------------------------------

**Author**: Saksham Khalkho  
**System**: AMD Ryzen 3 4300U, 8GB RAM, WSL2 + Docker  
**Date**: April 2026

------------------------------------------------------------------------

