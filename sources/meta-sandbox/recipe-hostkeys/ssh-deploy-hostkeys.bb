# Based on: sources/poky/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
#
# This is how to create the keys:
# cd recipe-deploy_hostkeys/ssh-deploy_hostkeys/openssh
# ssh-keygen -t rsa -b 4096 -N "" -f ssh_sandbox_rsa
#
# TODO: This recipe could not be tested as qemu does not use a root password.
#

SUMMARY = "Pre generated host keys mainly for speeding up our qemu tests"

SRC_URI = "file://ssh_sandbox_rsa \
		   file://ssh_sandbox_rsa.pub"

LICENSE = "CLOSED"

INHIBIT_DEFAULT_DEPS = "1"

do_install () {
    # Create .ssh directory for root user
    install -d ${D}${ROOT_HOME}/.ssh

    # Install the public key
    # install -m 0600 ${WORKDIR}/files/ssh_sandbox_rsa.pub ${D}${ROOT_HOME}/.ssh/ssh_sandbox_rsa.pub

    # Create authorized_keys file with the public key for remote access
    install -m 0600 ${WORKDIR}/ssh_sandbox_rsa.pub ${D}${ROOT_HOME}/.ssh/authorized_keys
}

# Define the files this package provides
FILES:${PN} = "${ROOT_HOME}/.ssh/ssh_sandbox_rsa.pub \
               ${ROOT_HOME}/.ssh/authorized_keys"
