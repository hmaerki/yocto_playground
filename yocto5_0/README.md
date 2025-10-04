# Yocto 5.0

This installation uses

* docker container `crops/poky:debian-12`

Positives
 * Out of the box
 * Compiles nicely

Downsides
 * Connecting to the container uses the wrong user
 * I could not make the vscode-yocto extension running in the containers.

## Links

https://github.com/crops/poky-container

## Within container


```bash
source poky/oe-init-build-env build

bitbake core-image-minimal
```