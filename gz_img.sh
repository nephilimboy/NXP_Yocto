#!/bin/bash
set -e

BOARD=bpi-r4
IMG_SIZE_MB=8192

OUTDIR=$(pwd)/out
IMG=${OUTDIR}/${BOARD}-sd-vendor-full.img

GPT=./gpt
BL2=./bl2.img
FIP=./u-boot_sdmmc.fip

KERNEL=./Image
DTB=./mt7988a-bananapi-bpi-r4-sdmmc-snand.dtb
UENV=./uEnv.txt
ROOTFS_IMG=./core-image-minimal-bpi-r4.rootfs.ext4

for f in $GPT $BL2 $FIP $KERNEL $DTB $UENV $ROOTFS_IMG; do
    [ -f "$f" ] || { echo "Missing file: $f"; exit 1; }
done

mkdir -p ${OUTDIR}

dd if=/dev/zero of=${IMG} bs=1M count=${IMG_SIZE_MB} status=progress

LOOP=$(sudo losetup -f --show ${IMG})

sudo dd if=${GPT} of=${LOOP} conv=fsync

sudo dd if=${BL2} of=${LOOP} bs=512 seek=34 conv=fsync

sudo dd if=${FIP} of=${LOOP} bs=512 seek=13312 conv=fsync

sync
sudo partprobe ${LOOP}
sleep 2

BOOT_PART=${LOOP}p5
ROOT_PART=${LOOP}p6

sudo mkfs.vfat -F32 -n BPI-BOOT ${BOOT_PART}

sudo dd if=${ROOTFS_IMG} of=${ROOT_PART} bs=4M status=progress conv=fsync

BOOT_MNT=$(mktemp -d)
sudo mount ${BOOT_PART} ${BOOT_MNT}

sudo mkdir -p ${BOOT_MNT}/bananapi/bpi-r4/linux-6.1

sudo cp ${KERNEL} ${BOOT_MNT}/bananapi/bpi-r4/linux-6.1/uImage
sudo cp ${DTB}    ${BOOT_MNT}/bananapi/bpi-r4/linux-6.1/
sudo cp ${UENV}   ${BOOT_MNT}/bananapi/bpi-r4/linux-6.1/

sync
sudo umount ${BOOT_MNT}
rmdir ${BOOT_MNT}

sudo losetup -d ${LOOP}

gzip -f ${IMG}


