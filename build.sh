#!/bin/bash

export ARCH="arm64"
export CROSS_COMPILE="/home/salvatore/aarch64-linux-android-4.9-kernel/bin/aarch64-linux-android-"

[ -n "$1" ] && OP="$1" || OP="build"

case ${OP} in
  build)
    make clean && \
    make mrproper && \
    make kernvatore_defconfig && \
    make -j8
    ;;
  config)
    make clean && \
    make mrproper && \
    make kernvatore_defconfig && \
    make menuconfig
    ;;
  *)
    echo "Go home. You're drunk"
    ;;
esac

exit 0
