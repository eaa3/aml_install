#!/bin/bash

INSTALL_TYPE=$0
WORKSPACE_PATH=$1

echo "INSTALL_TYPE: $INSTALL_TYPE"
echo "WORKSPACE_PATH: $WORKSPACE_PATH"

# checking if this script is being run from the curl-based install script or locally from host machine
# parameter base is different if run locally
if [ "$INSTALL_TYPE" == "./install.sh" ]
then
	INSTALL_TYPE=$1
	WORKSPACE_PATH=$2
fi

if [ -z "$INSTALL_TYPE" ] || [ "$INSTALL_TYPE" == "bash" ]
then 
    echo "usage: ./install.sh <install-option> [<optional-path-to-catkin-workspace>]"
    echo "example: ./install.sh indigo_gpu_docker"
    echo "install options: "
	exit 1
fi

rm -rf /tmp/aml_install
git clone --depth 1 -b master https://github.com/eaa3/aml_install.git /tmp/aml_install
cd /tmp/aml_install
./install_${INSTALL_TYPE}.sh $WORKSPACE_PATH