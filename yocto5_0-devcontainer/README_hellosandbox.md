# Add application `hellosandbox`

Add layer `sources/meta-sandbox` and a recipe `sources/meta-sandbox/recipe-custom` which builds `hellosandbox`.

## Links

* https://c-pointers.com/lbv/linux_yocto_rpi/linux_yocto_rpi_c/add_hello_world_app/add_hello_world_app.html

* sources/poky/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb


## Debugging

### Links

* https://fpgafw.pages.desy.de/docs-pub/yocto-doc/vscode_with_cmake_project.html
* https://jponsoftware.wordpress.com/2020/07/28/yocto-debugging-with-gdb/
* https://docs.yoctoproject.org/dev-manual/devtool.html
* https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gnat_ugn_unw/Remote-Debugging-using-gdbserver.html
* https://danieljunho.com/2020/04/22/gdbserver.html
* https://hackmd.io/@alanhc/yocto_project_debug

* build/tmp/work/x86_64-linux/gdb-cross-x86_64/14.2/build-x86_64-poky-linux/gdb/gdb

### Compile with debug symbols

Force rebuild

```bash
# bitbake -c compile -f hellosandbox
bitbake -f -c clean hellosandbox
bitbake --no-setscene -f hellosandbox
ls -l `find . -type f -name hellosandbox`
```

Analyse the binary. Within qemu:

```bash
gdb --quiet --readnow /usr/bin/hellosandbox --eval-command 'info sources' --eval-command 'exit'
```

```
Reading symbols from /usr/bin/hellosandbox...
Expanding full symbols from /usr/bin/hellosandbox...
/usr/bin/hellosandbox:

/usr/src/debug/glibc/2.39+git/csu/../sysdeps/x86_64/crtn.S, /usr/src/debug/hellosandbox/1.0/hellosandbox.c, /usr/include/bits/stdio2.h, 
/usr/include/bits/stdio2-decl.h, /usr/src/debug/hellosandbox/1.0/<built-in>, /usr/src/debug/glibc/2.39+git/csu/../sysdeps/x86_64/crti.S, 
/usr/src/debug/glibc/2.39+git/csu/init.c, /usr/src/debug/glibc/2.39+git/sysdeps/x86/abi-note.c, /usr/src/debug/glibc/2.39+git/posix/bits/types.h, 
/usr/src/debug/glibc/2.39+git/bits/stdint-intn.h, /usr/src/debug/glibc/2.39+git/bits/stdint-uintn.h, /usr/src/debug/glibc/2.39+git/elf/elf.h, 
/usr/src/debug/glibc/2.39+git/csu/abi-note.c, /usr/src/debug/glibc/2.39+git/csu/../sysdeps/x86_64/start.S
```

We have to map this directory containing `hellosandbox.c`:

    `set substitute-path /usr/src/debug/hellosandbox/1.0/ sources/meta-sandbox/recipe-custom/files`

### Run GDB session

qemu:
```bash
gdbserver localhost:23 /usr/bin/hellosandbox
```

```bash
build/tmp/work/x86_64-linux/gdb-cross-x86_64/14.2/build-x86_64-poky-linux/gdb/gdb \
  --quiet \
  --eval-command="set substitute-path /usr/src/debug/hellosandbox/1.0/ sources/meta-sandbox/recipe-custom/files" \
  --eval-command="target remote localhost:2323" \
  --eval-command="break main" \
  ./build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/usr/bin/hellosandbox \

break func_sandbox
```
