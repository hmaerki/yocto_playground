set -euox pipefail

# Assuming you are in /home/poky_builder
cd ${CODESPACE_VSCODE_FOLDER}/yocto5_0/poky
git clone --depth=1 git://git.yoctoproject.org/poky -b scarthgap .

# git checkout yocto-5.1.
