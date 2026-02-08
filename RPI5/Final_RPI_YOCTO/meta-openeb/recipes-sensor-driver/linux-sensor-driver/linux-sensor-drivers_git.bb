DESCRIPTION = "Prophesee Linux Sensor Drivers (kernel modules for Prophesee sensors)"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=e6a75371ba4d16749254a51215d13f97"

#SRC_URI = "git://github.com/prophesee-ai/linux-sensor-drivers.git;branch=kernel-6.6;protocol=https"
SRC_URI = "git://github.com/prophesee-ai/linux-sensor-drivers.git;branch=kernel-6.12;protocol=https"
#SRCREV = "${AUTOREV}"
SRCREV = "7165d5e69ebed78dcc63b36e1d0f451c42aa7aaa"
S = "${WORKDIR}/git"

inherit module

DEPENDS += "virtual/kernel"

EXTRA_OEMAKE += "EXTRA_CFLAGS='-DOMIT_PSEE_FORMATS'"

# Autoload modules
KERNEL_MODULE_AUTOLOAD += "imx636 genx320_driver"

# QA tweaks (optional)
INSANE_SKIP:${PN} += "debug-deps"
INSANE_SKIP:kernel-module-imx636 += "debug-deps"
INSANE_SKIP:kernel-module-genx320-driver += "debug-deps"

INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
