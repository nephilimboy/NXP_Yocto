working
meta-filesystems
meta-perl            = "HEAD:dca497d728792e3cb655c78455c2d649af312ce8"
meta-qt6             = "HEAD:00c3bd954341a2a755fdee6b978af952f51793e7"
meta-parsec
meta-tpm             = "HEAD:784ca4b6584101e971b2d5d76ec7b716ad1301b5"
meta-virtualization  = "HEAD:898239e810acbb7db93299f20deec8afe434f11b"
meta-openeb          = "<unknown>:<unknown>"

Sstate summary: Wanted 1634 Local 0 Mirrors 0 Missed 1634 Current 2910 (0% match, 64% complete)##################################################################################################################                     | ETA:  0:00:00
Removing 1 stale sstate objects for arch imx8mp_lpddr4_frdm: 100% |###################################################################################################################################################################| Time: 0:00:00
NOTE: Executing Tasks
ERROR: gtk+3-3.24.43-r0 do_configure: meson failed
ERROR: gtk+3-3.24.43-r0 do_configure: Execution of '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/temp/run.do_configure.4940' failed with exit code 1
ERROR: Logfile of failure stored in: /home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/temp/log.do_configure.4940
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/meta-imx/meta-imx-bsp/recipes-devtools/qemu/qemu-native_9.0.2.imx.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/meta-imx/meta-imx-bsp/recipes-graphics/imx-gpu-viv/imx-gpu-viv_6.4.11.p4.0-aarch64.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/gcc/gcc-cross_14.3.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_14.3.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-graphics/pango/pango_1.56.2.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot', '/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-support/atk/at-spi2-core_2.56.0.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/meson/meson_1.7.0.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-devtools/python/python3_3.13.4.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot', 'virtual:native:/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['qemu-native', 'libdrm', 'imx-gpu-viv', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-aarch64', 'cmake-native', 'gcc-cross-aarch64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'quilt-native', 'bzip2', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'gdk-pixbuf', 'gobject-introspection', 'cairo', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'mesa-gl', 'pango', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'cryptodev-linux', 'linux-libc-headers', 'libpng', 'at-spi2-core', 'attr', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'libcap-ng', 'libffi', 'libpcre2', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'gtk-doc-native', 'libjpeg-turbo-native', 'libpng-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'shared-mime-info-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=true -Dgtk_doc=false -Dxinerama=no -Dtests=false -Dcloudproviders=false -Dcolord=no -Dopengl=true -Dtracker3=false -Dwayland_backend=false -Dx11_backend=false...
| The Meson build system
| Version: 1.7.0
| Source dir: /home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/gtk+-3.24.43
| Build dir: /home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/build
| Build type: cross build
| Project name: gtk+
| Project version: 3.24.43
| C compiler for the host machine: aarch64-poky-linux-gcc -mcpu=cortex-a53+crc+crypto -mbranch-protection=standard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot (gcc 14.3.0 "aarch64-poky-linux-gcc (GCC) 14.3.0")
| C linker for the host machine: aarch64-poky-linux-gcc -mcpu=cortex-a53+crc+crypto -mbranch-protection=standard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot ld.bfd 2.44.0.20250715
| C compiler for the build machine: gcc (gcc 13.3.0 "gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0")
| C linker for the build machine: gcc ld.bfd 2.42
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: aarch64
| Host machine cpu: aarch64
| Target machine cpu family: aarch64
| Target machine cpu: aarch64
| Has header "crt/externs.h" : NO
| Has header "dlfcn.h" : YES
| Has header "ftw.h" : YES
| Has header "inttypes.h" : YES
| Has header "linux/memfd.h" : YES
| Has header "linux/input.h" : YES
| Has header "dev/evdev/input.h" : NO
| Has header "locale.h" : YES
| Has header "memory.h" : YES
| Has header "stdint.h" : YES
| Has header "stdlib.h" : YES
| Has header "string.h" : YES
| Has header "strings.h" : YES
| Has header "sys/mman.h" : YES
| Has header "sys/param.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/sysinfo.h" : YES
| Has header "sys/systeminfo.h" : NO
| Has header "sys/time.h" : YES
| Has header "sys/types.h" : YES
| Has header "unistd.h" : YES
| Library m found: YES
| Checking for function "dcgettext" with dependency -lm: YES
| Checking for function "getpagesize" with dependency -lm: YES
| Checking for function "getresuid" with dependency -lm: YES
| Checking for function "lstat" with dependency -lm: YES
| Checking for function "mmap" with dependency -lm: YES
| Checking for function "nearbyint" with dependency -lm: YES
| Checking for function "posix_fallocate" with dependency -lm: YES
| Checking for function "_lock_file" with dependency -lm: NO
| Checking for function "flockfile" with dependency -lm: YES
| Checking for function "mkstemp" with dependency -lm: YES
| Checking for function "mallinfo" with dependency -lm: YES
| Checking for function "round" with dependency -lm: YES
| Checking for function "rint" with dependency -lm: YES
| Checking for function "log2" with dependency -lm: YES
| Checking for function "exp2" with dependency -lm: YES
| Checking for function "sincos" with dependency -lm: YES
| Checking for function "trunc" with dependency -lm: YES
| Checking for function "localtime_r" with dependency -lm: YES
| Checking for function "fmin" with dependency -lm: YES
| Header "math.h" has symbol "isinf" : YES
| Header "math.h" has symbol "isnan" : YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wimplicit-function-declaration: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wunused: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wignored-qualifiers: YES
| Compiler for C supports arguments -Wno-discarded-qualifiers: YES
| Compiler for C supports arguments -Werror=implicit: YES
| Compiler for C supports arguments -Werror=nonnull: YES
| Compiler for C supports arguments -Werror=init-self: YES
| Compiler for C supports arguments -Werror=main: YES
| Compiler for C supports arguments -Werror=missing-braces: YES
| Compiler for C supports arguments -Werror=sequence-point: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=trigraphs: YES
| Compiler for C supports arguments -Werror=array-bounds: YES
| Compiler for C supports arguments -Werror=write-strings: YES
| Compiler for C supports arguments -Werror=address: YES
| Compiler for C supports arguments -Werror=int-to-pointer-cast: YES
| Compiler for C supports arguments -Werror=pointer-to-int-cast: YES
| Compiler for C supports arguments -Werror=empty-body: YES
| Compiler for C supports arguments -Werror=write-strings: YES (cached)
| Checking if "-Wl,-Bsymbolic" links: YES
| Checking if "-Wl,-z,relro" links: YES
| Checking if "-Wl,-z,now" links: YES
| Found pkg-config: YES (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency glib-2.0 found: YES 2.84.0
| Run-time dependency gobject-2.0 found: YES 2.84.0
| Run-time dependency gio-unix-2.0 found: YES 2.84.0
| Run-time dependency gmodule-2.0 found: YES 2.84.0
| Run-time dependency cairo found: YES 1.18.4
| Run-time dependency cairo-gobject found: YES 1.18.4
| Run-time dependency pango found: YES 1.56.2
| Run-time dependency fribidi found: YES 1.0.16
| Run-time dependency pangoft2 found: YES 1.56.2
| Run-time dependency freetype2 found: YES 26.2.20
| Run-time dependency pangocairo found: YES 1.56.2
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.12
| Run-time dependency epoxy found: YES 1.5.10
| Run-time dependency atk found: YES 2.56.0
| Run-time dependency harfbuzz found: YES 10.4.0
| Found CMake: NO
| Run-time dependency xkbcommon found: NO (tried pkgconfig and cmake)
| Run-time dependency iso-codes found: NO (tried pkgconfig and cmake)
| Checking for function "ngettext" : YES
| Program g-ir-scanner found: YES
| Program gen-gdk-gresources-xml.py found: YES (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot-native/usr/bin/nativepython3 /home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/gtk+-3.24.43/gdk/gen-gdk-gresources-xml.py)
| Configuring gdk.gresource.xml with command
| Found pkg-config: YES (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Build-time dependency gio-2.0 found: YES 2.84.0
| Program glib-compile-resources found: YES (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Build-time dependency glib-2.0 found: YES 2.84.0
| Program glib-mkenums found: YES (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.84.0 (cached)
| Program glib-mkenums found: YES (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.84.0 (cached)
| Program glib-genmarshal found: YES (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/recipe-sysroot-native/usr/bin/glib-genmarshal)
| Configuring gdkconfig.h using configuration
| Configuring gdkversionmacros.h using configuration
|
| ../gtk+-3.24.43/gdk/meson.build:285:2: ERROR: Problem encountered: No backends enabled
|
| A full log can be found at /home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4711 tasks of which 4682 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/sources/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure
    log: /home/dell/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build/tmp/work/cortexa53-crypto-mx8mp-poky-linux/gtk+3/3.24.43/temp/log.do_configure.4940
Summary: There were 2 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
dell@dell:~/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build$
dell@dell:~/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build$
dell@dell:~/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build$ nano conf/local.conf
dell@dell:~/Documents/AmirWorkSpace/ES_Test_Yocto_NXP/build$

