#!/bin/sh

echo -e "\033[1;34m\nTurluCode Docker GUI Apps: Generating docker-image for Mendeley Desktop...\033[0m"

# User/Group to build image for
USER_NAME=$(id -un)
USER_ID=$(id -u)
USER_GROUP_ID=$(id -g)

# Choose base image
BASE_IMG=$1
if [ $1 = "nvidia-ubuntu" ]; then
    BASE_IMG="nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04"
    TAG=nvidia
elif [ $1 = "ubuntu" ]; then
    BASE_IMG="ubuntu:18.04"
    TAG=x11
else
    echo "Oops! Critical error! Should not happen! Check script input!"
    exit 1
fi
echo -e "\033[0;32mUsing base-image: $BASE_IMG\033[0m"

# Use Dockerfile.in to generate Dockerfile
function generate_dockerfile() {
  eval "echo \"$(cat $1)\""
}

rm -rf Dockerfile || true
echo -e "\033[0;32mGenerating Dockerfile for user $USER_NAME ($USER_ID) and group id $USER_GROUP_ID\033[0m"
generate_dockerfile Dockerfile.in > Dockerfile

echo -e "\033[0;32mInitiating docker build...\033[0m\n"
docker build -t turlucode/mendeley-$TAG .
echo -e "\033[0;32m  \nBuild done!\033[0m"
