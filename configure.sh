#!/bin/bash

LINUXDIR="./linux"

if [ ! -d $LINUXDIR ]; then
	echo Linux Dir not found, please run \'git submodule init\'
	exit 1
fi

cd $LINUXDIR

echo Configuring for arm64

make distclean
make ARCH=arm64 defconfig

cd ..

echo Creating initramfs
mkdir --parents ramfs/{bin,dev,etc,lib,lib64,mnt/root,proc,root,sbin,sys}
cp ./scripts/init ramfs
cd ramfs/bin

echo Downloading BusyBox

# TODO: Download busybox here

cd ..
# initramfs creation from: https://wiki.gentoo.org/wiki/Custom_Initramfs
find . -print0 | cpio --null --create --format=newc | gzip --best > ../out/initramfs.cpio.gz && cd ..
