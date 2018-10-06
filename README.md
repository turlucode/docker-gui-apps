# docker-gui-apps
[![N|Solid](http://turlucode.com/wp-content/uploads/2017/10/turlucode_.png)](http://turlucode.com/)

A collection of Linux GUI apps by [TurluCode](http://turlucode.com).

## Prerequisites

Some packages require GL support and thus rely on the graphics drivers of the host. For this reason you will see apps tagged as
 - [NVIDIA-X11] where there is GL support
 - [X11] where there is no GL support

 Currently we support only NVIDIA via `nvidia-docker` __v1__.

### `nvidia-docker`

To install `nvidia-docker` v1 [follow this](https://github.com/turlucode/ros-docker-gui/blob/master/Readme.md#nvidia-graphics-card). For more info visit the [official NVIDIA support](https://github.com/NVIDIA/nvidia-docker).

# Build App

Use the proviced `Makefile` to build the deseried app:
````
# Prints Help
make
# E.g. Build Firefox
make firefox
````

## Run App

Each app needs different arguments in order to run. Run examples are localed at each app folder.

# Supported apps

_More info inside each app's readme_

- Mendeley
- Firefox

# Issues and Contributing
  - Please let us know by [filing a new 
issue](https://github.com/turlucode/ros-docker-gui/issues/new).
  - You can contribute by [opening a pull 
request](https://github.com/turlucode/ros-docker-gui/compare).