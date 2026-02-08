DESCRIPTION = "Ettus Research UHD (USRP Hardware Driver) - Host Tools only, no Python"
HOMEPAGE = "https://github.com/EttusResearch/uhd"
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=8255adf1069294c928e0e18b01a16282"

inherit cmake pkgconfig python3native

# --- Source ---

SRC_URI = "git://github.com/MicroPhase/antsdr_uhd.git;branch=master;protocol=https"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git/host"

DEPENDS = "\
    boost \
    libusb1 \
    python3-native \
    python3-mako-native \
    python3-requests-native \
    python3-numpy-native \
    python3-ruamel-yaml-native \
"

# -------------------
# Runtime dependencies
# -------------------
RDEPENDS:${PN} += "\
    python3-core \
    python3-misc \
    python3-mako \
    python3-requests \
    python3-numpy \
    python3-ruamel-yaml \
"




# --- CMake Options ---

EXTRA_OECMAKE = "\
    -DENABLE_PYTHON_API=OFF \
    -DENABLE_PYMOD_UTILS=OFF \
    -DENABLE_SIM=OFF \
    -DENABLE_X400=OFF \
    -DENABLE_N320=OFF \
    -DENABLE_X300=OFF \
    -DENABLE_USRP2=OFF \
    -DENABLE_USRP1=OFF \
    -DENABLE_N300=OFF \
    -DENABLE_E320=OFF \
    -DENABLE_E300=OFF \
    -DENABLE_TESTS=OFF \
    -DPython3_EXECUTABLE=${PYTHON} \
"


EXTRA_OECMAKE += "\
    -DCMAKE_SKIP_RPATH=TRUE \
    -DCMAKE_BUILD_RPATH_USE_ORIGIN=ON \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=FALSE \
    -DCMAKE_BUILD_TYPE=Release \
"



SECURITY_CFLAGS:remove = "-Wformat-security"
SECURITY_CXXFLAGS:remove = "-Wformat-security"

TARGET_CFLAGS:remove = "-Wformat-security"
TARGET_CXXFLAGS:remove = "-Wformat-security"


CXXFLAGS:remove = "-Werror=format-security"
CFLAGS:remove = "-Werror=format-security"


# UHD installs to /usr by default
FILES:${PN} += "\
    /usr/lib \
    /usr/bin \
    /usr/share/uhd \
"

# Suppress TMPDIR warnings in -src and -dev packages
INSANE_SKIP:${PN} += "buildpaths"
INSANE_SKIP:${PN}-dev += "buildpaths"
INSANE_SKIP:${PN}-src += "buildpaths"

