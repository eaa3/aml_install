#!/bin/bash

INSTALL_TYPE=$0
WORKSPACE_PATH=$1
INSTALL_FROM_HOST=false

# checking if this script is being run from the curl-based install script or locally from host machine
# parameter base is different if run locally
if [ "$INSTALL_TYPE" == "./install.sh" ]
then
	INSTALL_TYPE=$1
	WORKSPACE_PATH=$2
	INSTALL_FROM_HOST=true
fi

echo "INSTALL_TYPE: $INSTALL_TYPE"
echo "WORKSPACE_PATH: $WORKSPACE_PATH"

if [ "$INSTALL_FROM_HOST" == "true" ] && [ -z $WORKSPACE_PATH ]
then
	echo "WORKSPACE_PATH is empty: will prompt to use default, i.e. aml_ws"
fi

if [ -z "$INSTALL_TYPE" ] || [ "$INSTALL_TYPE" == "bash" ]
then 
    echo "usage: ./install.sh <install-option> [<optional-path-to-catkin-workspace>]"
    echo "example: ./install.sh indigo_gpu_docker"
    echo "install options: "
	exit 1
fi


if [ "$INSTALL_FROM_HOST" == "true" ]
then
	echo "Local install..."
	ROOT_DIR="$(cd $( dirname ${BASH_SOURCE[0]} ) && pwd)"
	${ROOT_DIR}/install_${INSTALL_TYPE}.sh $WORKSPACE_PATH
else
	echo "Curl-based install..."
	rm -rf /tmp/aml_install
	git clone --depth 1 -b master https://github.com/eaa3/aml_install.git /tmp/aml_install
	cd /tmp/aml_install
	./install_${INSTALL_TYPE}.sh $WORKSPACE_PATH
fi

