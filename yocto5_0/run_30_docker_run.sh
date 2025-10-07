set -euox pipefail

# Get the UID/GID of your current user to match inside the container (important for file permissions)
HOST_UID=$(id -u)
HOST_GID=$(id -g)
HOST_USER=$(id -un)

# Run the container, creating a user inside with matching UID/GID
# docker run --rm -it \
#     --name yocto-scarthgap-builder \
#     -v ${CODESPACE_VSCODE_FOLDER}/yocto5_0:/workdir \
#     -e HOST_USER_ID=$HOST_UID \
#     -e HOST_GROUP_ID=$HOST_GID \
#     --workdir=/workdir \
#     crops/poky:ubuntu-22.04

docker run --rm -it \
    --name yocto-scarthgap-builder \
    -v ${CODESPACE_VSCODE_FOLDER}/yocto5_0:/workdir \
    -e HOST_USER_ID=$HOST_UID \
    -e HOST_GROUP_ID=$HOST_GID \
    --workdir=/workdir \
    crops/poky:debian-12

# docker run --rm -it \
#     --name yocto-scarthgap-builder \
#     -v ${CODESPACE_VSCODE_FOLDER}/yocto5_0:/workdir \
#     --user $HOST_UID:$HOST_GID \
#     --workdir=/workdir \
#     crops/poky:ubuntu-22.04
