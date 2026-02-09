FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SYSTEM_USER_DTSI ?= "user_defined.dtsi"

SRC_URI:append = " file://user_defined.dtsi"

do_configure:append() {
    cp ${WORKDIR}/${SYSTEM_USER_DTSI} ${B}/device-tree
    echo "/include/ \"${SYSTEM_USER_DTSI}\"" >> ${B}/device-tree/system-top.dts
} 
