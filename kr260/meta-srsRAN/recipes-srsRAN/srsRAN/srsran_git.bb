SUMMARY = "srsRAN Project - 5G/4G radio stack"
DESCRIPTION = "Open source 4G/5G radio stack from srsRAN Project"
HOMEPAGE = "https://github.com/srsRAN/srsRAN_Project"
LICENSE = "AGPL-3.0-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=73f1eb20517c55bf9493b7dd6e480788"

SRC_URI = "git://github.com/srsRAN/srsRAN_Project.git;branch=main;protocol=https"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

DEPENDS = "\
    fftw \
    mbedtls \
    lksctp-tools \
    yaml-cpp \
    gtest \
    uhd \
    elfutils \
"


EXTRA_OECMAKE = "-DENABLE_TESTS=OFF"


do_install() {
    DESTDIR=${D} ninja -C ${B} install
}

do_install:append() {
    find ${D} -name "*.spdx" -delete
}

FILES:${PN} += "\
    /usr/bin \
"
