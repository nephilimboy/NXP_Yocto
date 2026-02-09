DESCRIPTION = "Prophesee Linux Sensor Drivers (kernel modules for Prophesee sensors)"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=e6a75371ba4d16749254a51215d13f97"

SRC_URI = "git://github.com/prophesee-ai/linux-sensor-drivers.git;branch=kernel-6.6;protocol=https"
SRCREV = "892268ff088a81a80c7c91a84b358b78df15af3e"

S = "${WORKDIR}/git"

inherit module

DEPENDS += "virtual/kernel"

EXTRA_OEMAKE += "EXTRA_CFLAGS='-DOMIT_PSEE_FORMATS'"

PACKAGES = "${PN} kernel-module-imx636-${KERNEL_VERSION} kernel-module-genx320-driver-${KERNEL_VERSION}"

FILES:kernel-module-imx636-${KERNEL_VERSION} = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/extra/imx636.ko"
FILES:kernel-module-genx320-driver-${KERNEL_VERSION} = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/extra/genx320_driver.ko"
FILES:${PN} = ""

RDEPENDS:${PN} += "kernel-module-imx636-${KERNEL_VERSION} kernel-module-genx320-driver-${KERNEL_VERSION}"

KERNEL_MODULE_AUTOLOAD += "imx636 genx320_driver"

do_compile() {
    oe_runmake KERNEL_SRC=${STAGING_KERNEL_DIR}
}

do_install() {
    oe_runmake KERNEL_SRC=${STAGING_KERNEL_DIR} INSTALL_MOD_PATH=${D} INSTALL_MOD_DIR=extra modules_install
    
    find ${D} -type d -name ".debug" -exec rm -rf {} + 2>/dev/null || true
    
    find ${D} -name "*.ko" -exec ${STRIP} --strip-debug {} \;
}

PACKAGES += "${PN}-dbg"
FILES:${PN}-dbg = "/usr/src/debug"

INSANE_SKIP:${PN} += "buildpaths"
INSANE_SKIP:kernel-module-imx636-${KERNEL_VERSION} += "buildpaths"
INSANE_SKIP:kernel-module-genx320-driver-${KERNEL_VERSION} += "buildpaths"
