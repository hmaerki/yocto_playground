source sources/poky/oe-init-build-env build

echo "---------------"
set -x

time bitbake core-image-minimal
