#!/bin/bash

INSTALL_TYPE=$0


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
./install_${INSTALL_TYPE}.sh $1