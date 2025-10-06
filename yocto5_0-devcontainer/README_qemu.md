# QEMU

## Links

* https://docs.yoctoproject.org/dev-manual/qemu.html
* https://docs.yoctoproject.org/dev/dev-manual/qemu.html#runqemu-command-line-options
* https://wiki.qemu.org/Documentation/Networking (SLIRP)


## Qemu binary

```bash
source sources/poky/oe-init-build-env build

runqemu --help

Usage: you can run this script with any valid combination
of the following environment variables (in any order):
  KERNEL - the kernel image file to use
  BIOS - the bios image file to use
  ROOTFS - the rootfs image file or nfsroot directory to use
  DEVICE_TREE - the device tree blob to use
  MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
  Simplified QEMU command-line options can be passed with:
    nographic - disable video console
    nonetwork - disable network connectivity
    novga - Disable VGA emulation completely
    sdl - choose the SDL UI frontend
    gtk - choose the Gtk UI frontend
    gl - enable virgl-based GL acceleration (also needs gtk or sdl options)
    gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk or sdl options)
    egl-headless - enable headless EGL output; use vnc (via publicvnc option) or spice to see it
    (hint: if /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create
    one suitable for mesa llvmpipe software renderer)
    serial - enable a serial console on /dev/ttyS0
    serialstdio - enable a serial console on the console (regardless of graphics mode)
    slirp - enable user networking, no root privilege is required
    snapshot - don't write changes back to images
    kvm - enable KVM when running x86/x86_64 (VT-capable CPU required)
    kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
    publicvnc - enable a VNC server open to all hosts
    audio - enable audio
    guestagent - enable guest agent communication
    qmp=<path> - create a QMP socket (defaults to unix:qmp.sock if unspecified)
    [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
  tcpserial=<port> - specify tcp serial port number
  qemuparams=<xyz> - specify custom parameters to QEMU
  bootparams=<xyz> - specify custom kernel parameters during boot
  help, -h, --help: print this text
  -d, --debug: Enable debug output
  -q, --quiet: Hide most output except error messages

Examples:
  runqemu
  runqemu qemuarm
  runqemu tmp/deploy/images/qemuarm
  runqemu tmp/deploy/images/qemux86/<qemuboot.conf>
  runqemu qemux86-64 core-image-sato ext4
  runqemu qemux86-64 wic-image-minimal wic
  runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
  runqemu qemux86 iso/hddimg/wic.vmdk/wic.vhd/wic.vhdx/wic.qcow2/wic.vdi/ramfs/cpio.gz...
  runqemu qemux86 qemuparams="-m 256"
  runqemu qemux86 bootparams="psplash=false"
  runqemu path/to/<image>-<machine>.wic
  runqemu path/to/<image>-<machine>.wic.vmdk
  runqemu path/to/<image>-<machine>.wic.vhdx
  runqemu path/to/<image>-<machine>.wic.vhd

To exit QEMU enter Control-a followed by x
```

Optional parameter: `./build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.qemuboot.conf`


This command makes qemu stop in the boot process as qemu wants to connect to the graphical device.
We get a chance to see the output of qemu and here we see the port assignements.

```bash
runqemu slirp

runqemu - INFO - Network configuration: ip=dhcp
runqemu - INFO - Port forward: hostfwd=tcp:127.0.0.1:2222-:22 hostfwd=tcp:127.0.0.1:2323-:23
runqemu - INFO - Running /workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/work/x86_64-linux/qemu-helper-native/1.0/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:35:02 -netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23,tftp=/workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/deploy/images/qemux86-64 -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -drive file=/workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20251006075145.ext4,if=virtio,format=raw -usb -device usb-tablet -usb -device usb-kbd   -cpu IvyBridge -machine q35,i8042=off -smp 4 -m 256 -serial mon:vc -serial null -display none  -kernel /workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/deploy/images/qemux86-64/bzImage -append 'root=/dev/vda rw  ip=dhcp oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1 swiotlb=0 '

==> Now qemu hangs, it should be started with 'nographics'
```

## Qemu starting

```bash
source sources/poky/oe-init-build-env build

runqemu slirp nographic

==> Now qemu boots completely
```

## ssh into qemu

```bash
ssh qemu
```

Not that this command depends on `~/.ssh/config` which originates from `.devcontainer/ssh_config`
