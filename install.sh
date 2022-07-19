#!/bin/bash
mkdir ./bin/objects
sudo apt-get -y install libx11-dev
sudo apt-get -y install libxrandr-dev
sudo apt-get -y install libxinerama-dev
sudo apt-get -y install libxcursor-dev
sudo apt-get -y install libxi-dev
sudo apt-get -y install libglu1-mesa-dev
sudo apt-get -y install libglew-dev
sudo apt-get -y install g++
sudo apt-get -y install make
sudo apt-get -y install cmake
sudo rm -r ./libs/glfw-3.3.7/build
cmake -S ./libs/glfw-3.3.7 -B ./libs/glfw-3.3.7/build
(cd ./libs/glfw-3.3.7/build && make)
(cd ./libs/glfw-3.3.7/build && sudo make install)
make clean
make
