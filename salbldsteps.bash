# This just saves us some repetition in SAL setup scripts
source ${LOADSTACK}
setup lsst_distrib
PYTHON_BUILD_VERSION=$(find /opt/lsst/software/stack -name Python.h | head -1 \
			   | xargs dirname | tr '/' ' ' | awk '{print $NF}' \
			   | sed 's/python//')
export PYTHON_BUILD_VERSION
source ${LSST_SDK_INSTALL}/setup.env

