SUMMARY = "Device Tree Overlay for Prophesee GenX320 on Raspberry Pi 5"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

DEPENDS += "dtc-native"

SRC_URI = "file://genx320-overlay.dts"

#S = "${WORKDIR}"
S = "${UNPACKDIR}"

do_compile() {
    dtc -@ -H epapr -I dts -O dtb \
        -o genx320.dtbo \
        ${S}/genx320-overlay.dts
}

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/overlays
    install -m 0644 genx320.dtbo \
        ${D}${nonarch_base_libdir}/firmware/overlays/
}

FILES:${PN} += " \
    ${nonarch_base_libdir}/firmware/overlays/genx320.dtbo \
"

RPI_KERNEL_DEVICETREE_OVERLAYS += "genx320.dtbo"
