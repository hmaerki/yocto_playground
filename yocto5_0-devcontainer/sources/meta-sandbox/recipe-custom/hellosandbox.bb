#
# See:
#
# * https://c-pointers.com/lbv/linux_yocto_rpi/linux_yocto_rpi_c/add_hello_world_app/add_hello_world_app.html
# * sources/poky/meta-skeleton/recipes-skeleton/hello-single/hello_1.0.bb
#
SUMMARY = "Hello World Application"
LICENSE = "CLOSED"

SRC_URI = "file://hellosandbox.c"

S = "${WORKDIR}"

do_compile() {
        ${CC} ${CFLAGS} ${LDFLAGS} -o hellosandbox hellosandbox.c
}

do_install() {
        install -d ${D}${bindir}
        install -m 0755 hellosandbox ${D}${bindir}
}
