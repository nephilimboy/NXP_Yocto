FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SYSTEM_USER_DTSI ?= "axi-iic-user.dtsi"

SRC_URI:append = " \
    file://axi-iic-user.dtsi \
    file://0001-Update-the-logic-to-check-if-cpu-is-present-in-the-d.patch \
"

do_configure:append() {
    cp ${WORKDIR}/${SYSTEM_USER_DTSI} ${B}/device-tree
    echo "/include/ \"${SYSTEM_USER_DTSI}\"" >> ${B}/device-tree/system-top.dts
}
