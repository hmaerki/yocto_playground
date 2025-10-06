SUMMARY = "Hello World Application"
LICENSE = "CLOSED"

SRC_URI = "file://helloworld.c"

do_compile() {
        ${CC} ${CFLAGS} ${LDFLAGS} -o helloworld helloworld.c
}

do_install() {
        install -d ${D}${bindir}
        install -m 0755 helloworld ${D}${bindir}
}
