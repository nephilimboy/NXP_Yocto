SUMMARY = "Prophesee OpenEB SDK"
DESCRIPTION = "OpenEB is an open-source event-based SDK from Prophesee"
HOMEPAGE = "https://github.com/prophesee-ai/openeb"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "git://github.com/nephilimboy/OpenEB_ES.git;branch=master;protocol=https"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"

inherit cmake pkgconfig python3native

DEPENDS = "\
    cmake-native \
    ninja-native \
    python3-native \
    python3 \
    python3-pybind11 \
    python3-numpy \
    python3-setuptools \
    python3-cython \
    protobuf \
    protobuf-native \
    boost \
    libusb1 \
    libeigen \
    glew \
    glfw \
    opencv \
    v4l-utils \
    udev \
    zlib \
"

RDEPENDS:${PN} += "python3-core python3-modules libpython3 opencv"

PYTHON_BASEVERSION = "3.12"

TARGET_CFLAGS:remove = "-Werror=type-limits"
TARGET_CFLAGS:remove = "-Werror=sign-compare"
TARGET_CXXFLAGS:remove = "-Werror=type-limits"
TARGET_CXXFLAGS:remove = "-Werror=sign-compare"
SECURITY_CFLAGS:remove = "-Werror"
SECURITY_CXXFLAGS:remove = "-Werror"

CXXFLAGS:append = " -std=c++17 -fPIC"

EXTRA_OECMAKE = " \
    -DUSE_OPENGL_ES3=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
    \
    -DOpenEB_BUILD_EXAMPLES=OFF \
    -DOpenEB_COMPILE_PYTHON3_BINDINGS=OFF \
    -DOpenEB_BUILD_PYTHON_BINDINGS=OFF \
    -DCOMPILE_PYTHON3_BINDINGS=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_DOCS=OFF \
    \
    -DWITH_EXAMPLES=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_APPS=ON \
    -DBUILD_SAMPLES=ON \
    \
    -DUSE_OPEN_PD=ON \
    -DUSE_SIMULATOR=OFF \
    -D_GLIBCXX_USE_CXX11_ABI=1 \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_STANDARD_REQUIRED=ON \
    \
    -DWITH_OPENCV=ON \
    -DOpenCV_DIR=${STAGING_LIBDIR}/cmake/opencv4 \
    \
    -DPython3_ROOT_DIR=${STAGING_DIR_TARGET}${prefix} \
    -DPython3_INCLUDE_DIR=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
    -DPython3_LIBRARY=${STAGING_LIBDIR}/libpython${PYTHON_BASEVERSION}.so \
    -DPython3_LIBRARIES=${STAGING_LIBDIR}/libpython${PYTHON_BASEVERSION}.so \
    -DPython3_EXECUTABLE=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
    -DPython3_FIND_STRATEGY=LOCATION \
    -DPython3_FIND_IMPLEMENTATIONS=CPython \
    -DPython3_FIND_REGISTRY=NEVER \
    -DPython3_FIND_FRAMEWORK=NEVER \
    \
    -DProtobuf_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
    -DProtobuf_INCLUDE_DIR=${STAGING_INCDIR} \
    -DProtobuf_LIBRARY=${STAGING_LIBDIR}/libprotobuf.so \
    -DPROTOC_PATH=${STAGING_BINDIR_NATIVE}/protoc \
    \
    -DCMAKE_SYSTEM_PROCESSOR=arm \
    -DCMAKE_SYSTEM_NAME=Linux \
    -DCMAKE_SYSTEM_PROCESSOR=cortex-a7 \
"

EXTRA_OECMAKE:append = " \
    -DBUILD_HAL_PSEE_PLUGINS=ON \
    -DBUILD_HAL_PLUGIN_GEN3_FX3=ON \
    -DBUILD_HAL_PLUGIN_GEN31_FX3=ON \
    -DBUILD_HAL_PLUGIN_GEN4=ON \
    -DBUILD_HAL_PLUGIN_GEN41=ON \
    -DBUILD_HAL_PLUGIN_FILE=ON \
    -DBUILD_HAL_PLUGIN_USB=ON \
"

do_configure:prepend() {
    PY_LIB="${STAGING_LIBDIR}/libpython${PYTHON_BASEVERSION}.so"
    if [ ! -e "$PY_LIB" ]; then
        alt_lib=$(find ${STAGING_LIBDIR} -maxdepth 1 -name "libpython${PYTHON_BASEVERSION}*.so" | head -n 1)
        if [ -n "$alt_lib" ] && [ "$alt_lib" != "$PY_LIB" ]; then
            echo "Creating symlink: $PY_LIB -> $alt_lib"
            ln -sf $(basename "$alt_lib") "$PY_LIB"
        else
            echo "WARNING: Python shared lib not found; creating dummy symlink"
            touch "$PY_LIB"
        fi
    fi

    PROTOC_BIN=$(find ${STAGING_DIR_NATIVE} -name protoc -type f 2>/dev/null | head -n1)
    if [ -z "$PROTOC_BIN" ]; then
        PROTOC_BIN=$(which protoc 2>/dev/null || true)
    fi

    if [ -n "$PROTOC_BIN" ] && [ -f "$PROTOC_BIN" ]; then
        echo "Found protoc at: $PROTOC_BIN"
        mkdir -p ${B}/bin
        ln -sf $PROTOC_BIN ${B}/bin/protoc
    else
        echo "ERROR: protoc not found anywhere!"
        find ${STAGING_DIR_NATIVE} -name "*protoc*" -type f 2>/dev/null
        exit 1
    fi
}

do_configure:append() {
    find ${B} -name "*.make" -o -name "build.ninja" | xargs sed -i 's|protobuf::protoc|${STAGING_BINDIR_NATIVE}/protoc|g' || true
    find ${B} -name "CMakeCache.txt" | xargs sed -i 's|protobuf::protoc|${STAGING_BINDIR_NATIVE}/protoc|g' || true

    if [ -f "${B}/build.ninja" ]; then
        sed -i 's|protobuf::protoc|${STAGING_BINDIR_NATIVE}/protoc|g' ${B}/build.ninja
    fi
}

do_compile:prepend() {
    export PATH="${STAGING_BINDIR_NATIVE}:${PATH}"
    export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"

    if ! which protoc >/dev/null 2>&1; then
        echo "ERROR: protoc not in PATH during compile"
        echo "PATH: $PATH"
        find ${STAGING_DIR_NATIVE} -name "protoc" -type f 2>/dev/null
        exit 1
    fi
}

do_install() {
    install -d ${D}${bindir}
    install -d ${D}${libdir}

    if [ -d "${B}/bin" ]; then
        for f in ${B}/bin/*; do
            if [ -f "$f" ] && [ -x "$f" ] && [ "$(basename "$f")" != "protoc" ]; then
                install -m 0755 "$f" ${D}${bindir}/
                echo "Installed binary: $(basename $f)"
            fi
        done
    fi

    for lib in \
        libmetavision_hal.so.5.1.1 \
        libmetavision_sdk_base.so.5.1.1 \
        libmetavision_hal_discovery.so.5.1.1 \
        libmetavision_sdk_core.so.5.1.1 \
        libmetavision_sdk_stream.so.5.1.1 \
        libmetavision_sdk_ui.so.5.1.1; do

        if [ -f "${B}/lib/$lib" ]; then
            install -m 0755 "${B}/lib/$lib" ${D}${libdir}/
            echo "Installed library: $lib"
        fi
    done

    if [ -d "${B}/lib/metavision" ]; then
        echo "=== Copying entire metavision directory structure ==="

        install -d ${D}${libdir}/metavision

        cp -r ${B}/lib/metavision/* ${D}${libdir}/metavision/

        echo "Copied entire metavision directory to ${D}${libdir}/"

        find ${D}${libdir}/metavision -type f | head -20
    fi

    install -d ${D}${sysconfdir}/metavision/hal
    echo "/usr/lib/metavision/hal" > ${D}${sysconfdir}/metavision/hal/plugins-path

    echo "=== Installed binaries ==="
    ls -la ${D}${bindir}/* 2>/dev/null || echo "No binaries installed"

    echo "=== Installed main libraries ==="
    ls -la ${D}${libdir}/libmeta*.so* 2>/dev/null || echo "No main libraries installed"

    echo "=== Installed metavision directory structure ==="
    find ${D}${libdir}/metavision -type d 2>/dev/null | head -10 || echo "No metavision directory found"
}

do_install:append() {
    cd ${D}${libdir}

    for lib in *.so.5.1.1; do
        if [ -f "$lib" ]; then
            major_lib="${lib%.1.1}"
            if [ ! -e "$major_lib" ]; then
                ln -sf "$lib" "$major_lib"
                echo "Created symlink: $major_lib -> $lib"
            fi

            base_lib="${lib%.5.1.1}.so"
            if [ ! -e "$base_lib" ]; then
                ln -sf "$major_lib" "$base_lib"
                echo "Created symlink: $base_lib -> $major_lib"
            fi
        fi
    done

    if [ -f "${D}${libdir}/libmetavision_psee_hw_layer.so" ]; then
        echo "REMOVING DUPLICATE: ${D}${libdir}/libmetavision_psee_hw_layer.so"
        rm -f ${D}${libdir}/libmetavision_psee_hw_layer.so*
        echo "Only keeping libmetavision_psee_hw_layer.so in metavision/hal/plugins/"
    fi

    echo "=== Final library symlinks ==="
    ls -la ${D}${libdir}/libmeta*.so* 2>/dev/null || echo "No libraries found"

    echo "=== Removing all debug files ==="

    find ${D} -type d -name ".debug" -exec rm -rf {} + 2>/dev/null || true

    find ${D} -type f -name "*.debug" -delete 2>/dev/null || true

    if [ -d "${D}${bindir}" ]; then
        find ${D}${bindir} -type f -executable -exec ${STRIP} {} \; 2>/dev/null || true
    fi

    if [ -d "${D}${libdir}" ]; then
        find ${D}${libdir} -maxdepth 1 -type f -name "*.so*" -exec ${STRIP} {} \; 2>/dev/null || true
        find ${D}${libdir}/metavision -type f -name "*.so*" -exec ${STRIP} {} \; 2>/dev/null || true
    fi

    echo "=== Checking for remaining debug files ==="
    find ${D} -name ".debug" -o -name "*.debug" | while read f; do
        if [ -e "$f" ]; then
            echo "WARNING: Debug file still exists: $f"
            rm -rf "$f"
        fi
    done

    echo "=== Final file structure ==="
    echo "Binaries:"
    find ${D}${bindir} -maxdepth 1 -type f | head -10
    echo "Main libraries:"
    find ${D}${libdir} -maxdepth 1 -name "*.so*" | head -10
    echo "Metavision directory contents:"
    find ${D}${libdir}/metavision -type f | head -20 || true
}

PACKAGES = "${PN}"

FILES:${PN} = " \
    ${bindir}/* \
    ${libdir}/libmetavision*.so* \
    ${libdir}/metavision/* \
    ${sysconfdir}/metavision/hal/plugins-path \
"

FILES:${PN}-dev = ""

INSANE_SKIP:${PN} = "dev-so already-stripped ldflags file-rdeps installed-vs-shipped buildpaths"
ERROR_QA:remove = "multiple-shlib-providers"
WARN_QA:append = " multiple-shlib-providers"

FILES_SOLIBSDEV = ""

INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
INHIBIT_PACKAGE_STRIP = "0"
