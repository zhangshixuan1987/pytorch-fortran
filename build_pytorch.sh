#!/bin/bash -e

# Abort on failure
set -e -o pipefail

# Setup programming environment
source .env_mach_specific.sh

# Do the full installation for Perlmutter
source config.sh $@

# Clean any previous install
#./clean.sh

# Build PyTorch
echo "Building PyTorch"
# Configure the installation
#mkdir -p $INSTALL_BASE && cd $INSTALL_BASE
#cd $INSTALL_BASE 
#[ -d pytorch ] && rm -rf pytorch
#git clone --recursive --branch ${PYTORCH_BRANCH} $PYTORCH_URL
#cd $BUILD_DIR
#git submodule update --init --recursive
#python3 setup.py clean
#conda activate seacrogs

cd $BUILD_DIR

source /global/common/software/e3sm/anaconda_envs/base/etc/profile.d/conda.sh
conda activate e3sm_unified_1.10.0_pm-cpu
export PYTHON_VERSION=3.10.14
export PYTHONPATH="/global/common/software/e3sm/anaconda_envs/base/envs/e3sm_unified_1.10.0_pm-cpu/lib/python3.10/site-packages:${BUILD_DIR}"

export PYTHONUSERBASE=${INSTALL_DIR}
python3 -m pip install --prefix=${PYTHONUSERBASE} --ignore-installed  typing-extensions
python3 -m pip install --prefix=${PYTHONUSERBASE} --ignore-installed  mkl-static mkl-include
python3 -m pip install --prefix=${PYTHONUSERBASE} --ignore-installed  pybind11
python3 -m pip install --prefix=${PYTHONUSERBASE} --ignore-installed  sympy==1.13.1 
python3 -m pip install --prefix=${PYTHONUSERBASE} --ignore-installed  -r requirements.txt

cd $BUILD_DIR
#CMAKE_C_COMPILER=$(which mpicc) CMAKE_CXX_COMPILER=$(which mpicxx) python3 setup.py develop --user --prefix=${INSTALL_DIR}
python3 setup.py develop --user --prefix=${INSTALL_DIR}

# Install torchvision
echo "Building torchvision"
[ -d vision ] && rm -rf vision
git clone --branch $VISION_BRANCH https://github.com/pytorch/vision.git
cd $BUILD_DIR/vision

python3 setup.py develop --user --prefix=${INSTALL_DIR}

#CMAKE_C_COMPILER=$(which mpicc) CMAKE_CXX_COMPILER=$(which mpicxx) python3 setup.py develop --user --prefix=${INSTALL_DIR}
