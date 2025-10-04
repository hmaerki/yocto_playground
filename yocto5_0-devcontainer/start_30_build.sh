# source sources/poky/oe-init-build-env build
source sources/poky/oe-init-build-env build-qemu-arm64

time bitbake core-image-minimal
