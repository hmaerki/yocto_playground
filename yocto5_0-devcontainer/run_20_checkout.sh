set -euox pipefail

# Assuming you are in /home/poky_builder
cd sources/poky
git clone --depth=1 git://git.yoctoproject.org/poky -b scarthgap .

# git checkout yocto-5.1.
