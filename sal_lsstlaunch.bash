#!/bin/bash
CONFIG_FILE=$1
source /opt/lsst/sal/salbldsteps.bash 2>&1 > /dev/null
for i in xml idl sal salobj ATDome ATDomeTrajectory ATMCSSimulator \
             simactuators standardscripts scriptqueue externalscripts ; do
    setup ts_${i} -t current
done

setup display_firefly
if [ -e ${HOME}/notebooks/.user_setups ]; then
    source ${HOME}/notebooks/.user_setups
fi
exec python3 -m ipykernel -f ${CONFIG_FILE}

