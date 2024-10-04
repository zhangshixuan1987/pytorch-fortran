#!/bin/bash -l

source .env_mach_specific.sh

export USE_CUDA=0 
export USE_CUDNN=0 
export USE_MKLDNN=1
export _GLIBCXX_USE_CXX11_ABI=1
export MAX_JOBS=1 

wkdir="/global/homes/z/zhan391/.conda/envs/pytorch"
if [ -d $wkdir ]; then 
  rm -rvf $wkdir 
fi 

# use conda to install 
#cpu only version
#conda install pytorch==2.4.0 torchvision==0.19.0 torchaudio==2.6.0 cpuonly -c pytorch -p ${wkdir}
# conda install pytorch torchvision -c pytorch  -p ${wkdir} 

# CUDA 12.4
#python3 -m pip install --prefix=${wkdir}  torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cu124

#cpu only version
python3 -m pip install --prefix=${wkdir}  --ignore-installed mkl mkl-include pybind11 typing-extensions 
python3 -m pip install --prefix=${wkdir}  torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cpu

#python3 -m pip install --prefix=${wkdir} torch torchvision torchaudio # --index-url https://download.pytorch.org/whl/cpu 

