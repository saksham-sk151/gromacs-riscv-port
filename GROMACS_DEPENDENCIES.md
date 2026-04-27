# GROMACS Dependency Analysis for RISC-V Porting

## Build System Requirements
- **CMake**: Version 3.28 or newer (REQUIRED)
- **C++ Compiler**: C++17 or newer (REQUIRED)
- **Minimum Compiler Versions**:
  - Clang: Version 14+
  - GCC: Version 11+

## Core Dependencies (REQUIRED)
1. **LibStdCpp** - Standard C++ library
2. **HWLOC** - Hardware Locality (version 1.5+)
   - Purpose: CPU topology detection
   - Status: Need to check RISC-V support

## Optional Dependencies
1. **TinyXML2** (version 6.0.0+)
   - Purpose: XML parsing
   
2. **Heffte** (version 2.2.0+)
   - Purpose: FFT library for parallel computing
   - Variants: CUDA, ROCM, ONEAPI
   - **Note**: May need RISC-V alternative

3. **cuFFTMp** 
   - Purpose: CUDA FFT multi-process
   - **RISC-V Status**: NOT AVAILABLE (CUDA-specific)
   - **Alternative needed**: CPU-based FFT

4. **VMD** - Visual Molecular Dynamics
   - Purpose: Visualization (optional)

5. **ImageMagick**
   - Purpose: Image conversion
   - Status: Should work on RISC-V

## GPU Dependencies (NOT RISC-V Compatible Yet)
- **CUDA** (version 12.1+) - NVIDIA only
- **HIP/ROCm** (version 5.2+) - AMD only
- **ONEAPI** - Intel only

## Porting Strategy for RISC-V

### ✅ Should Work Out-of-Box
- CMake
- GCC 11+ (available for RISC-V)
- C++ standard library
- ImageMagick

### ⚠️ Need to Verify
- HWLOC (hardware detection for RISC-V)
- TinyXML2 (likely portable)

### ❌ Need Alternatives
- CUDA/cuFFTMp → Use CPU-based FFTW
- HIP/ROCm → Disable GPU features
- Heffte with GPU → Use CPU version

## Next Steps
1. Check if HWLOC supports RISC-V
2. Find CPU-based FFT library (FFTW)
3. Compile GROMACS with CPU-only flags
4. Test basic functionality

## Build Command (Estimated)
```bash
cmake .. \
  -DCMAKE_C_COMPILER=riscv64-linux-gnu-gcc \
  -DCMAKE_CXX_COMPILER=riscv64-linux-gnu-g++ \
  -DGMX_GPU=OFF \
  -DGMX_MPI=OFF \
  -DGMX_OPENMP=ON
```

