set -euox pipefail

# Get the UID/GID of your current user to match inside the container (important for file permissions)
HOST_UID=$(id -u)
HOST_GID=$(id -g)
HOST_USER=$(id -un)

# Run the container, creating a user inside with matching UID/GID
docker run --rm -it \
    --name yocto-dunfell-builder \
    -v ${CODESPACE_VSCODE_FOLDER}/yocto3_1/poky:/home/poky_builder/poky \
    -v ${CODESPACE_VSCODE_FOLDER}/yocto3_1/build:/home/poky_builder/build \
    -e HOST_USER_ID=$HOST_UID \
    -e HOST_GROUP_ID=$HOST_GID \
    crops/poky:ubuntu-20.04
