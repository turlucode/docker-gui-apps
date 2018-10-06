# Mendeley Desktop
[![N|Solid](http://turlucode.com/wp-content/uploads/2017/10/turlucode_.png)](http://turlucode.com/mendeley-in-docker-container/)

[Mendeley](https://www.mendeley.com/) is a desktop and web program produced by Elsevier for managing and sharing research papers, discovering research data and collaborating online.

## Prerequisites

### `nvidia-docker`

This package requires `nvidia-docker` __v1__ to run. To install `nvidia-docker` v1 [follow this](https://github.com/turlucode/ros-docker-gui/blob/master/Readme.md#nvidia-graphics-card). For more info visit the [official NVIDIA support](https://github.com/NVIDIA/nvidia-docker). 

## Persistent setup

To make the data of this app persistent you need to mount the following two paths:
- `$HOME/.config`
- `$HOME/.local/share/data`

## Run App

Assuming nvidia-plugin is running, here is an example command with persistent data:
````
nvidia-docker run --rm -it --privileged --net=host --ipc=host \
-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
-v $HOME/.Xauthority:/home/$(id -un)/.Xauthority -e XAUTHORITY=/home/$(id -un)/.Xauthority \
-v $HOME/.config:/home/$(id -un)/.config \
-v $HOME/.local/share/data:/home/$(id -un)/.local/share/data \
turlucode/mendeley-nvidia
````