# SSH

The qemu image by default creates the root user without any password.

## QEMU ssh port mapping

openssh serves at port 22 which is mapped by qemu to port 2222.

This command makes qemu stop in the boot process as qemu wants to connect to the graphical device.
We get a chance to see the output of qemu and here we see the port assignements.

```bash
runqemu slirp

runqemu - INFO - Network configuration: ip=dhcp
runqemu - INFO - Port forward: hostfwd=tcp:127.0.0.1:2222-:22 hostfwd=tcp:127.0.0.1:2323-:23
runqemu - INFO - Running /workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/work/x86_64-linux/qemu-helper-native/1.0/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:35:02 -netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23,tftp=/workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/deploy/images/qemux86-64 -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -drive file=/workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20251006075145.ext4,if=virtio,format=raw -usb -device usb-tablet -usb -device usb-kbd   -cpu IvyBridge -machine q35,i8042=off -smp 4 -m 256 -serial mon:vc -serial null -display none  -kernel /workspaces/yocto_playground/yocto5_0-devcontainer/build/tmp/deploy/images/qemux86-64/bzImage -append 'root=/dev/vda rw  ip=dhcp oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1 swiotlb=0 '

==> Now qemu hangs, it should be started with 'nographics'
```

## Do NOT write to ~/.ssh/known_hosts

There are annoying security messages after deploying a new qemu image:

* Do NOT write to ~/.ssh/known_hosts
* Do AVOID this questions: Are you sure you want to continue connecting (yes/no)?

This may be supressed by `ssh -p 2222 -o StrictHostKeyChecking=No -o UserKnownHostsFile=/dev/null root@localhost $@`

The same is achived by `~/.ssh/config` which originates from [.devcontainer/ssh_config](.devcontainer/ssh_config).

With `~/.ssh/config` in place, on may call

```bash
ssh qemu
```
