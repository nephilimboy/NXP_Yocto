SUMMARY = "srsRAN Project - 5G/4G radio stack"
DESCRIPTION = "Open source 4G/5G radio stack from srsRAN Project"
HOMEPAGE = "https://github.com/srsRAN/srsRAN_Project"
LICENSE = "AGPL-3.0-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=73f1eb20517c55bf9493b7dd6e480788"

SRC_URI = "git://github.com/srsRAN/srsRAN_Project.git;branch=main;protocol=https"
SRCREV = "${AUTOREV}"

# git ls-remote https://github.com/srsRAN/srsRAN_Project.git main
S = "${WORKDIR}/git"

inherit cmake pkgconfig

# Add uhd
DEPENDS = "\
    fftw \
    mbedtls \
    lksctp-tools \
    yaml-cpp \
    zeromq \
    gtest \
"

RDEPENDS:${PN} += "bash"

EXTRA_OECMAKE = "-DENABLE_TESTS=OFF"

do_install() {
    ## Ninja not Makefile!
    # oe_runmake install DESTDIR=${D}
    DESTDIR=${D} ninja -C ${B} install
}

# Fixing ERROR: srsran-git-r0 do_package_qa: QA Issue: File /usr/share/srsran.spdx in package srsran contains reference to TMPDIR [buildpaths]
do_install:append() {
    find ${D} -name "*.spdx" -delete
}

FILES:${PN} += "\
    /usr/bin \
    /usr/lib \
    /usr/etc \
    /usr/share \
"


