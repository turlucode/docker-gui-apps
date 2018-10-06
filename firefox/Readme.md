# Mendeley Desktop
[![N|Solid](http://turlucode.com/wp-content/uploads/2017/10/turlucode_.png)](http://turlucode.com/)

[Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/) is a free and open-source web browser developed by Mozilla Foundation and its subsidiary, Mozilla Corporation.

## Persistent setup

To make the data of this app persistent you need to mount the following two paths:
- `-v $HOME/.mozilla:/home/turlucde/.mozilla`
- `-v $HOME/Downloads:/home/turlucde/Downloads`

## Run App

Here is an example command with persistent data:
````
docker run -it --rm --shm-size 2g \                         
   -e DISPLAY=$DISPLAY -e XAUTHORITY=/tmp/.docker.xauth \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   turlucode/firefox
````

### Enable sound

To pass sound to your host device use docker arguments:
````
--device /dev/snd \
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
--group-add $(getent group audio | cut -d: -f3)
````

### Enable web-cam

To enable access to your webcam use docker argument:
````
--device /dev/video0
````
_video0_ is usually the default. It might be different in your case, so just make sure you use the correct one.

# Troubleshooting

- If you get errors like the following:

  ````
  libGL error: No matching fbConfigs or visuals found
  libGL error: failed to load driver: swrast
  Could not initialize GLX
  ````
  Then run `xhost local:root` and try again.

- Shared Memory Size crashes:
    To prevent crashes from happening when running Firefox inside a Docker container, the size of the shared memory located at /dev/shm must be increased. The issue is documented [here](https://bugzilla.mozilla.org/show_bug.cgi?id=1338771#c10).
    By default, the size is 64MB, which is not enough. It is recommended to use a size of 2GB.
    - Add the `--shm-size 2g` parameter to the `docker run` command.
    - Use the shared memory of the host, by mapping `/dev/shm` via the parameter `-v /dev/shm:/dev/shm` of the `docker run` command.
- Sound issues:
    [Take a look here](https://github.com/jessfraz/dockerfiles/issues/85)
