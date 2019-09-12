#!/bin/bash
CONFIG_FILE=$1
source /opt/lsst/sal/salbldsteps.bash
setup ts_xml -t current
setup ts_sal -t current
setup ts_salobj -t current
setup ts_scriptqueue -t current
setup ts_ATDome -t current
setup ts_ATDomeTrajectory -t current
setup ts_standardscripts -t current
setup ts_externalscripts -t current
setup display_firefly
if [ -e ${HOME}/notebooks/.user_setups ]; then
    source ${HOME}/notebooks/.user_setups
fi
exec python3 -m ipykernel -f ${CONFIG_FILE}

