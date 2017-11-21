
prerequisites
=============

1. Recent NVIDIA driver installed.
2. docker installed.  [Reference](https://store.docker.com/editions/community/docker-ce-server-ubuntu?tab=description)
3. nvidia-docker installed. [Reference](https://github.com/NVIDIA/nvidia-docker)

setup steps 
###########

1. Get UID and GID of current user
   echo $UID
   echo $GROUPS
2. Create a Dockerfile as below
 
 
3. Create a docker image
   mkdir tmpdocker
   cd tmpdocker
   #put Dockerfile from step#2 in current folder
   nvidia-docker build -t nvdevtools -f Dockerfile.xxx . 
 
4. Run
   nvidia-docker run --privileged -it -e DISPLAY -v $HOME/.Xauthority:/home/test/.Xauthority --net=host nvdevtools /bin/bash
  
   Till here you get a docker container that is capable to run native GL, CUDA, GL+CUDA interop applications.
5. Test
   Use -v option to mount local folder to the container. The below example maps /home/test/project in host environment to /home/nvidia/project in docker container.
  
   nvidia-docker run --privileged -it -e DISPLAY -v $HOME/.Xauthority:/home/test/.Xauthority -v /home/test/project:/home/nvidia/project --net=host nvdevtools /bin/bash
   For example, if you mapped CUDA SDK samples, you can try:
   NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/debug/simpleGL
 
 
How it works
============

1.  Container shares X11 unix socket /tmp/.X11-unix fom host.  The option "--net=host" implicitly makes it.
2.  Container shares .Xauthority from host.  The option "-v $HOME/.Xauthority:/home/nvidia/.Xauthority" did this.  The container image was created with a user "nvdia" that has the same UID and GROUPS with current user in host.
3.  User mode nvidia driver .so files are automatically mapped into docker container. This is done by nvidia-docker.
4.  All devices are mapped into container by option "--privileged"
    It's possible to remove requirement of "--privileged" by mapping only requried devices
    nvidia-docker mapps below devcies. Those are sufficient to CUDA applications.

    * /dev/nvidia0
    * /dev/nvidiactl
    * /dev/nvidia-uvm
    * /dev/nvidia-uvm-tools

    For OpenGL supports, the required devices need to be investigataed. Below are already known:

    * /dev/dri/carad0
