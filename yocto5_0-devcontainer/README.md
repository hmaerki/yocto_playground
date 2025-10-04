# Yocto 5.0

This installation uses

* docker container based on `crops/yocto:debian-12`
* devcontainer

Positives
 * Compiles nicely
 * As vscode runs in devcontainer, all vscode extensions, also vscode-yocto, run like a charm

Downsides
 * Dockerfile is a combination from https://github.com/crops/yocto-dockerfiles/blob/master/dockerfiles/debian/debian-12/debian-12-base/Dockerfile and `mcr.microsoft.com/devcontainers/base:bookworm`.

## Links

https://github.com/crops/poky-container

## Within container

source sources/poky/oe-init-build-env build

bitbake core-image-minimal
