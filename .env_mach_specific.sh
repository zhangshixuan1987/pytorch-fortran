# This file is for user convenience only and is not used by the model
# Changes to this file will be ignored and overwritten
# Changes to the environment should be made in env_mach_specific.xml
# Run ./case.setup --reset to regenerate this file

source /global/common/software/e3sm/anaconda_envs/base/etc/profile.d/conda.sh
source /global/common/software/e3sm/anaconda_envs/base/etc/profile.d/mamba.sh

export E3SMU_SCRIPT="/global/common/software/e3sm/anaconda_envs/load_e3sm_unified_1_10_0_pm-cpu_gnu_mpich"
export E3SMU_MACHINE="pm-cpu"
export E3SMU_MPI="SYSTEM"

mamba activate e3sm_unified_1.10.0_pm-cpu
source /global/common/software/e3sm/anaconda_envs/spack/e3sm_unified_1_10_0_pm-cpu_gnu_mpich/share/spack/setup-env.sh
spack env activate e3sm_unified_1_10_0_pm-cpu_gnu_mpich

module unload cray-hdf5-parallel cray-netcdf-hdf5parallel cray-parallel-netcdf PrgEnv-gnu PrgEnv-nvidia cudatoolkit craype-accel-nvidia80 craype-accel-host perftools-base perftools darshan

module load PrgEnv-gnu/8.3.3 gcc/11.2.0 craype-accel-host cray-libsci craype cray-mpich/8.1.27 cray-hdf5-parallel/1.12.2.7 cray-netcdf-hdf5parallel/4.9.0.7 cray-parallel-netcdf/1.12.3.7 cmake/3.22.0

export MPICH_ENV_DISPLAY=1
export MPICH_VERSION_DISPLAY=1
export OMP_STACKSIZE=128M
export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export HDF5_USE_FILE_LOCKING=FALSE
export PERL5LIB=/global/cfs/cdirs/e3sm/perl/lib/perl5-only-switch
export FI_CXI_RX_MATCH_MODE=software
export MPICH_COLL_SYNC=MPI_Bcast

