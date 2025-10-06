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

* https://github.com/crops/yocto-dockerfiles
* https://github.com/crops/poky-container

## Features

### yocto-bitbake

Seems to work fine

### qemu

[README_qemu.md](README_qemu.md)

The image may be started in qemu.

SLIP is used and therefor no root rights are required.

ssh connection (without password, prompts) to qemu.

## Features to be tested

Build C code and remote debugging.

### devtool

Show how to use it.

### hellosandbox

[README_hellosandbox.md](README_hellosandbox.md)

## Features intentially NOT supported

### Toaster

...

### KAS

KAS is NOT used in this setup

* https://kas.readthedocs.io/en/latest

Install kas-4.8.2

```bash
python3 -m pip install kas --break-system-packages
```