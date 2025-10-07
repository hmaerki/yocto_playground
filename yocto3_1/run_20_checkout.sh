set -euox pipefail

# Assuming you are in /home/poky_builder
cd ${CODESPACE_VSCODE_FOLDER}/yocto3_1/poky
git clone git://git.yoctoproject.org/poky .
# Checkout the Dunfell branch, e.g., dunfell-3.1.20
git checkout yocto-3.1.20
