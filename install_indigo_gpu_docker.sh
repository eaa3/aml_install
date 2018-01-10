#!/bin/bash


mkdir -p $HOME/Projects/aml_ws/src
cd $HOME/Projects/aml_ws/src

rm -rf aml
git clone https://github.com/RobotsLab/AML.git aml

cd aml/aml_docker

./docker_build.sh indigo-cuda
./build_aml.sh dev:indigo-cuda
