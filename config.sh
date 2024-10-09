# Source me to setup config for the installations

#INSTALL_BASE="/pscratch/sd/z/zhan391/SEACROGS_project/e3sm_model/machine_learning"

# Configure the installation
export INSTALL_NAME="pytorch"
export PYTORCH_VERSION="v2.6.0"
export PYTORCH_BRANCH="v${PYTORCH_VERSION}"
export PYTORCH_URL=git@github.com:zhangshixuan1987/pytorch.git
export VISION_VERSION="0.19.0"
export VISION_BRANCH="v${VISION_VERSION}"

INSTALL_BASE=$HOME/.conda/envs
export BUILD_DIR=$INSTALL_BASE/${INSTALL_NAME}
export INSTALL_DIR=$INSTALL_BASE/$INSTALL_NAME/torch
export MPICH_GPU_SUPPORT_ENABLED=0
export MAX_JOBS=16

# Environment path "fixes"
# - Pick up cuRand and cuSparse from separate directory
#export CMAKE_PREFIX_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/23.1/math_libs/12.0:$CMAKE_PREFIX_PATH
#export CPATH=${CUDA_HOME}/../../math_libs/include:$CPATH
export CMAKE_PREFIX_PATH="$CMAKE_PREFIX_PATH:$INSTALL_DIR"
#export CMAKE_INSTALL_PREFIX=$INSTALL_DIR

## - Help pytorch test build find cudnn header
#export CPATH=${CUDNN_DIR}/include:$CPATH

export PYTORCH_BUILD_VERSION=$PYTORCH_VERSION # to prevent dependency issues
export PYTORCH_BUILD_NUMBER=1
export USE_CUDA=0
export USE_XPU=0
export USE_DISTRIBUTED=1
export TORCH_CUDA_ARCH_LIST=""
export USE_CUDNN=0
export USE_MKLDNN=1
export _GLIBCXX_USE_CXX11_ABI=1

# Trying to pick up additional libs at build time
export LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib64"


# Disable MPI
export USE_MPI=1

# Disabling some build components
export BUILD_TEST=0
export USE_NNPACK=0
export USE_QNNPACK=0
export USE_PYTORCH_QNNPACK=0
export USE_XNNPACK=0
export USE_ROCM=0
export CFLAGS="-Wno-maybe-uninitialized -Wno-uninitialized -lstdc++"
export CXX_LIBS="-lstdc++"
export CXX=CC #g++
export CC=cc #gcc

# Setup conda
#module load conda

# Print some stuff
echo "  Configuring on $(hostname) as $USER"
echo "  Build directory $BUILD_DIR"
echo "  Install directory $INSTALL_DIR"
module list
