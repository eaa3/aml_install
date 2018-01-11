#!/bin/bash

ROOT_DIR="$( cd "$( dirname '${BASH_SOURCE[0]}' )" && pwd )"

${ROOT_DIR}/fetch_aml.sh $1
AML_PATH=$(cat $ROOT_DIR/aml_path.txt)

cd ${AML_PATH} && git checkout aml_dev
cd aml_docker


./docker_build.sh dummy
./build_aml.sh dev:dummy