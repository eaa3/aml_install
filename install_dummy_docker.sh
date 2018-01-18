#!/bin/bash

ROOT_DIR="$(cd $( dirname ${BASH_SOURCE[0]} ) && pwd)"

rm ${ROOT_DIR}/aml.branchbkp > /dev/null 2>&1
mv ${ROOT_DIR}/aml.branch ${ROOT_DIR}/aml.branchbkp

echo "dummy" > ${ROOT_DIR}/aml.branch
AML_BRANCH=$(cat ${ROOT_DIR}/aml.branch)

${ROOT_DIR}/fetch_aml.sh $1
AML_PATH=$(cat $ROOT_DIR/.aml_path)

cd ${AML_PATH} && git checkout ${AML_BRANCH}
cd aml_docker


./docker_build.sh dummy
echo "dummy aml build: ./build_aml.sh dev:dummy"
# ./build_aml.sh dev:dummy

rm ${ROOT_DIR}/aml.branch > /dev/null 2>&1
mv ${ROOT_DIR}/aml.branchbkp ${ROOT_DIR}/aml.branch > /dev/null 2>&1
rm ${ROOT_DIR}/aml.branchbkp > /dev/null 2>&1