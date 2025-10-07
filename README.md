# Yocto Playground

This repo is a yocto playground with may be used to practice yocto workflows:

* Write/change recipies
* Test vscode-yocto extension for bitbake and devtool

* Short feedbackloop
  * Change recipe
  * Build image
  * start qemu
  * verify

* Fully dockerize - should run on any linux or WSL with docker installed
* Setup made easy due to devcontainer.

* Filesystem shared with host
* docker container does not store any state
* qemu may be run inside or outside of the docker container

## docker build environment - limited tooling

These just use the docker containers to build - however tooling is very limited.

Details see [yocto5_0/README.md](yocto5_0/README.md)

* Directory [yocto5_0](yocto5_0)
* Directory [yocto3_1](yocto3_1)

## docker devcontainer - fully supported tooling

* Directory [yocto5_0-devcontainer](yocto5_0-devcontainer)

Details see [yocto5_0-devcontainer/README.md](yocto5_0-devcontainer/README.md)