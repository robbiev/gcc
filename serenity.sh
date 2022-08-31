#!/usr/bin/env bash
set -eo pipefail

SERENITY_HOME=~/src/serenity
SERENITY_ARCH=i686
SERENITY_INSTALL_ROOT=$SERENITY_HOME/Build/i686/Root
export PATH=$SERENITY_HOME/Toolchain/Local/i686/bin:$PATH
export CPPFLAGS="$CPPFLAGS -DHAVE_SYSCALL_H=1 -DHAVE_SYSCALL=1"
export CFLAGS="$CFLAGS -DHAVE_SYSCALL_H=1 -DHAVE_SYSCALL=1"
./configure "--host=${SERENITY_ARCH}-pc-serenity" "--target=${SERENITY_ARCH}-pc-serenity" "--with-sysroot=/" "--with-build-sysroot=${SERENITY_INSTALL_ROOT}" "--enable-languages=c,c++,go" "--disable-lto" "--disable-nls" "--enable-shared" "--enable-default-pie" "--enable-host-shared" "--enable-threads=posix" "--enable-initfini-array" "--with-linker-hash-style=gnu"
make "all-gcc" "all-target-libgcc" "all-target-libstdc++-v3" "all-target-libatomic" "all-target-libgo" "-j8"
make "DESTDIR=${SERENITY_INSTALL_ROOT}" "install-gcc" "install-target-libgcc" "install-target-libstdc++-v3" "install-target-libatomic" "install-target-libgo"
