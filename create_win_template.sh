#!/bin/bash
IMAGE=../Win2012_R2_64Bit.iso 
FLOPPY=Autounattend.vfd 
VIRTIO_ISO=../virtio-win-0.1-94.iso 
IMAGE=../Win2012_R2_64Bit.qcow2
ISO=../Win2012_R2_64Bit.iso 
qemu-img create -f qcow2 -o preallocation=metadata $IMAGE 100G
KVM=/usr/libexec/qemu-kvm
git pull && sh create-autounattend-floppy.sh
$KVM -m 4096 -smp 2 -cdrom $ISO -drive file=$VIRTIO_ISO,index=3,media=cdrom -fda $FLOPPY $IMAGE -boot d -vga std -k en-us -vnc :1
