#FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
#SRC_URI += "file://axi-iic-user.dtsi"


#FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

#SYSTEM_DT_OVERLAY += "axi-iic-user.dtsi"


FILESEXTRAPATHS:prepend := "${THISDIR}/files:" 
SYSTEM_USER_DTSI ?= "axi-iic-user.dtsi"
 
SRC_URI += "file://${SYSTEM_USER_DTSI}"
 
do_configure:append() {
        cp ${WORKDIR}/${SYSTEM_USER_DTSI} ${B}/device-tree
        echo "/include/ \"${SYSTEM_USER_DTSI}\"" >> ${B}/device-tree/system-top.dts
}
