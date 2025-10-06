source sources/poky/oe-init-build-env build

echo "---------------"
set -x

runqemu slirp nographic ./build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.qemuboot.conf
