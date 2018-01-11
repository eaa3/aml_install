#!/bin/bash

INSTALL_TYPE=$1


if [ -z "$INSTALL_TYPE" ]
then 
    echo "usage: ./install.sh <install-option>"
    echo "example: ./install.sh indigo_gpu_docker"
	exit 1
fi

git clone --depth 1 -b master https://github.com/eaa3/aml_install.git /tmp/aml_install
cd /tmp/aml_install
./install_${INSTALL_TYPE}.sh