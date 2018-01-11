# AML Installation Step-by-Step
Public install scripts for the Advanced Manipulation Learning (AML) framework. 

## Select AML branch

Modify `aml.branch` to contain your desired AML branch name.

## Setting up docker and (optional) nvidia-docker

1. Install Docker CE, see [installation instructions](https://docs.docker.com/engine/installation/). 

  * Also perform the [post installation instructions](https://docs.docker.com/engine/installation/linux/linux-postinstall/), so that docker can be run without requiring root privileges by a non-root user. (this is optional, otherwise, scripts must be run as root)  
2. (optional) If you have an NVIDIA graphic card, install the latest drivers.
  * Recommended method: 

	```
	sudo add-apt-repository ppa:graphics-drivers/ppa
	sudo apt update
	```

	Then, on Ubuntu from the menu / Dash, click on the "Additional Drivers" and on the tab with the same name, select the driver you want to use, and "Apply changes". Wait until the driver is downloaded and installed, and reboot.


3. (optional) If you have an NVIDIA graphic card and is using Ubuntu 16.04, install nvidia-docker 1.0. See [installation instructions](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-1.0)). 

  * Also install nvidia-modprobe by running `sudo apt-get install nvidia-modprobe`, possibly a reboot is required.


The example below sets up a docker image with ubuntu 14.04, GPU acceleation, ROS indigo and all other required dependencies for AML.

`curl -s https://raw.githubusercontent.com/eaa3/aml_install/master/install_indigo_gpu_docker.sh | bash -s`


## Setting up host computer without docker

The example below assumes a fresh install of ubuntu 14.04. It installs ROS indigo and all other required dependencies for AML (obs.: without GPU acceleration).

`curl -s https://raw.githubusercontent.com/eaa3/aml_install/master/install_indigo_host.sh | bash -s`
