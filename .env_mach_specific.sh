# This file is for user convenience only and is not used by the model
# Changes to this file will be ignored and overwritten
# Changes to the environment should be made in env_mach_specific.xml
# Run ./case.setup --reset to regenerate this file
. /usr/share/lmod/8.3.1/init/sh
module unload cray-hdf5-parallel cray-netcdf-hdf5parallel cray-parallel-netcdf cray-netcdf cray-hdf5 PrgEnv-gnu PrgEnv-intel PrgEnv-nvidia PrgEnv-cray PrgEnv-aocc gcc-native intel intel-oneapi nvidia aocc cudatoolkit climate-utils cray-libsci matlab craype-accel-nvidia80 craype-accel-host perftools-base perftools darshan
module load PrgEnv-gnu/8.5.0 gcc/11.2.0 cray-libsci/23.02.1.1 craype-accel-host craype/2.7.20 cray-mpich/8.1.25 cray-hdf5-parallel/1.12.2.3 cray-netcdf-hdf5parallel/4.9.0.3 cray-parallel-netcdf/1.12.3.3 cmake/3.24.3 evp-patch
export LD_LIBRARY_PATH=/global/common/software/nersc/pm-2022q4/sw/evp-patch/lib64:/opt/cray/pe/mpich/8.1.25/ofi/gnu/9.1/lib:/opt/cray/pe/mpich/8.1.25/gtl/lib:/opt/cray/pe/gcc/11.2.0/snos/lib64:/opt/cray/libfabric/1.15.2.0/lib64:
export PATH=/global/common/software/nersc/pm-2022q4/sw/evp-patch/bin:/global/common/software/nersc/pm-2022q4/spack/linux-sles15-zen/cmake-3.24.3-k5msymx/bin:/opt/cray/pe/parallel-netcdf/1.12.3.3/bin:/opt/cray/pe/netcdf-hdf5parallel/4.9.0.3/bin:/opt/cray/pe/hdf5-parallel/1.12.2.3/bin:/opt/cray/pe/hdf5/1.12.2.3/bin:/opt/cray/pe/mpich/8.1.25/ofi/gnu/9.1/bin:/opt/cray/pe/mpich/8.1.25/bin:/opt/cray/pe/craype/2.7.20/bin:/opt/cray/pe/gcc/11.2.0/bin:/global/common/software/e3sm/anaconda_envs/base/bin:/global/common/software/e3sm/anaconda_envs/base/condabin:/opt/nersc/pe/bin:/global/common/software/nersc/bin:/opt/cray/libfabric/1.15.2.0/bin:/global/homes/z/zhan391/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/lib/mit/bin:/opt/cray/pe/bin:
export MPICH_ENV_DISPLAY=1
export MPICH_VERSION_DISPLAY=1
export MPICH_MPIIO_DVS_MAXNODES=1
export OMP_STACKSIZE=128M
export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export HDF5_USE_FILE_LOCKING=FALSE
export PERL5LIB=/global/cfs/cdirs/e3sm/perl/lib/perl5-only-switch
export FI_CXI_RX_MATCH_MODE=software
export MPICH_COLL_SYNC=MPI_Bcast
export NETCDF_PATH=/opt/cray/pe/netcdf-hdf5parallel/4.9.0.3/gnu/9.1
export PNETCDF_PATH=/opt/cray/pe/parallel-netcdf/1.12.3.3/gnu/9.1
export GATOR_INITIAL_MB=4000MB
export ADIOS2_ROOT=/global/cfs/cdirs/e3sm/3rdparty/adios2/2.9.1/cray-mpich-8.1.25/gcc-11.2.0
export BLA_VENDOR=Generic
export Albany_ROOT=/global/common/software/e3sm/albany/2024.03.26/gcc/11.2.0
export Trilinos_ROOT=/global/common/software/e3sm/trilinos/15.1.1/gcc/11.2.0
export MOAB_ROOT=/global/cfs/cdirs/e3sm/software/moab/gnu
