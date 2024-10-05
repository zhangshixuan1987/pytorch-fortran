# Copyright (c) 2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

#!/bin/bash
set -e

source .env_mach_specific.sh
python="/global/common/software/e3sm/anaconda_envs/base/envs/e3sm_unified_1.10.0_pm-cpu/lib/python3.10"
torchdir="/global/homes/z/zhan391/.conda/envs/pytorch/lib/python3.10/site-packages"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${torchdir}/torch/lib"
export PYTHONPATH="${python}/site-packages:${torchdir}"
CMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}/bin/cmake;${torchdir}/torch/share/cmake;${topdir}/pybind11/share/cmake"

CONFIG=Release
OPENACC=0
TORCH_CUDA_ARCH_LIST=""

CMAKE_C_COMPILER=$(which mpicc) CMAKE_CXX_COMPILER=$(which mpicxx) CMAKE_Fortran_COMPILER=$(which ftn)

BUILD_PATH=$(pwd -P)/gnu/
INSTALL_PATH=${1:-${torchdir}/torch/}
mkdir -p $BUILD_PATH/build_proxy $BUILD_PATH/build_fortproxy $BUILD_PATH/build_example
# c++ wrappers 
(
    cd $BUILD_PATH/build_proxy 
    cmake -DOPENACC=$OPENACC -DCMAKE_BUILD_TYPE=$CONFIG -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH -DCMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH -DCMAKE_CXX_COMPILER=$CMAKE_CXX_COMPILER -DTORCH_CUDA_ARCH_LIST=$TORCH_CUDA_ARCH_LIST ../../src/proxy_lib 

    cmake --build . --parallel
    make install
)

# fortran bindings
(
    export PATH=$NVPATH:$PATH 
    cd $BUILD_PATH/build_fortproxy
    cmake -DOPENACC=$OPENACC -DCMAKE_BUILD_TYPE=$CONFIG -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH -DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER} -DCMAKE_PREFIX_PATH=$INSTALL_PATH/lib ../../src/f90_bindings/
    cmake --build . --parallel
    make install
)

# fortran examples
(
    export PATH=$NVPATH:$PATH 
    cd $BUILD_PATH/build_example
    cmake -DOPENACC=$OPENACC -DCMAKE_BUILD_TYPE=$CONFIG -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH -DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER} ../../examples/
    cmake --build . --parallel
    make install
)

#link lib to torch lib dir
ln -sf ${PWD}/gnu/build_proxy/libpytorch_proxy.so $torchdir
ln -sf ${PWD}/gnu/build_fortproxy/libpytorch_fort_proxy.so $torchdir
