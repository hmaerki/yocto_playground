source sources/poky/oe-init-build-env build

echo "---------------"
set -x

ssh -p 2222 -o PubkeyAuthentication=No root@localhost
