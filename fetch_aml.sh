#!/bin/bash

ROOT_DIR="$( cd "$( dirname '${BASH_SOURCE[0]}' )" && pwd )"
CATKIN_WS_PATH=$1
AML_BRANCH=aml_dev

if [ -z "$CATKIN_WS_PATH" ]
then
    
    echo "usage: ./fetch_aml.sh [<optional-path-to-catkin-workspace>]"
    CATKIN_WS_PATH=${HOME}/Projects/aml_ws/
	echo "This script will create a default catkin workpace at ${CATKIN_WS_PATH}, proceed? (y/n)"
	
	read answer
	if echo "$answer" | grep -iq "^y" ;then
		echo "Fetching AML..."
	else
	    echo "Exiting script. Operation cancelled."
	    exit 1
	fi

fi

CATKIN_WS_ABS_PATH="$( cd "$( dirname "${CATKIN_WS_PATH}/." )" && pwd )"
AML_ABS_PATH="${CATKIN_WS_ABS_PATH}/src/aml"
echo ${AML_ABS_PATH}

# Backing up existing aml directory, if it exists
rm -rf aml.bkp > /dev/null 2>&1
mv -f -b ${AML_ABS_PATH} ${ROOT_DIR}/aml.bkp > /dev/null 2>&1
mkdir -p ${CATKIN_WS_ABS_PATH}/src


git clone -b ${AML_BRANCH} https://github.com/RobotsLab/AML.git ${AML_ABS_PATH}


echo ${AML_ABS_PATH} > aml_path.txt