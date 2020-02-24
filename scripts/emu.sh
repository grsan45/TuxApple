#!/usr/bin/sh

#Make sure you install qemu for aarch64

sudo qemu-system-aarch64 -machine virt -cpu cortex-a57 -nographic -smp 1 -kernel out/zImage -append "console=ttyAMA0" -initrd out/initramfs.cpio.gz
