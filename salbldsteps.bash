# This just saves us some repetition in SAL setup scripts
source ${LOADSTACK}
unset LD_PRELOAD
setup lsst_distrib

PYTHON_BUILD_VERSION=$(python3 --version|cut -f2 -d' '|cut -c 1-3)m
p_dir=$(dirname $(command -v python3))
export PYTHON_BUILD_LOCATION=${p_dir:0:-4}
PYTHON_INCLUDE_DIR=${PYTHON_BUILD_LOCATION}/include
PYTHON_INCLUDE_DIR="${PYTHON_INCLUDE_DIR}/python${PYTHON_BUILD_VERSION}"
PYTHON_LIBRARY_DIR=${PYTHON_BUILD_LOCATION}/lib
export PYTHON_LIBRARY_DIR PYTHON_INCLUDE_DIR PYTHON_BUILD_VERSION
OSPL_MASTER_PRIORITY=1
export OSPL_MASTER_PRIORITY
setupscript=${LSST_SDK_INSTALL}/setup.env
if [ -f "${OSPL_HOME}/release.com" ]; then
    setupscript=${OSPL_HOME}/release.com
fi
source ${setupscript}

