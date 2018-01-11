# AML Installation Step-by-Step
public install scripts for the Advanced Manipulation Learning (AML) framework. 

## Select AML branch

Modify `aml.branch` to contain your desired AML branch name.

## Setting up docker

The example below sets up a docker image with ubuntu 14.04, GPU acceleation, ROS indigo and all other required dependencies for AML.

`curl -s https://raw.githubusercontent.com/eaa3/aml_install/master/install_indigo_gpu_docker.sh | bash -s`


## Setting up host computer without docker

The example below assumes a fresh install of ubuntu 14.04. It installs ROS indigo and all other required dependencies for AML (obs.: without GPU acceleration).

`curl -s https://raw.githubusercontent.com/eaa3/aml_install/master/install_indigo_host.sh | bash -s`
