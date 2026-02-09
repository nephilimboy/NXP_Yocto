SUMMARY = "ArduPilot flight stack"
DESCRIPTION = "ArduPilot autopilot firmware (Copter)"
HOMEPAGE = "https://ardupilot.org"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = "file://COPYING.txt;md5=d32239bcb673463ab874e80d47fae504"

#SRC_URI = "gitsm://github.com/ArduPilot/ardupilot.git;branch=master;protocol=https;"

SRC_URI = "gitsm://github.com/nephilimboy/ardupilot_zynq.git;branch=master;protocol=https;"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"


inherit python3native pkgconfig


DEPENDS += " \
    python3-native \
    python3-pip-native \
    python3-future-native \
    python3-setuptools-native \
    python3-wheel-native \
    python3-empy-native \
    python3-pexpect-native \
"


TARGET_CC_ARCH += "${LDFLAGS}"

do_configure() {
    cd ${S}


   
    export CC="${CC}"
    export CXX="${CXX}"
    export AR="${AR}"
    export LD="${LD}"
    export CFLAGS="${CFLAGS}"
    export CXXFLAGS="${CXXFLAGS}"
    export LDFLAGS="${LDFLAGS}"

  
    ./waf configure \
        --board=obal \
        --prefix=/usr
}

do_compile() {
    cd ${S}
    ./waf copter
}

do_install() {
    install -d ${D}/usr/bin
    install -m 0755 \
        ${S}/build/obal/bin/arducopter \
        ${D}/usr/bin/arducopter
}

FILES:${PN} += "/usr/bin/arducopter"
