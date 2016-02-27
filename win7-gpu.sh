#!/bin/bash

set -x

KVM_DIR=/var/lib/libvirt
IMAGE=win7.qcow2
CD=Windows7Ultimate.iso
NAME=win7
PORT=5914
RAM=5000
IFACE=win7
MONITOR=unix:$(pwd)/win7-mon,server,nowait
qemu-system-x86_64 -enable-kvm -m $RAM -cpu host -smp 7,cores=7 -boot d -cdrom $KVM_DIR/boot/$CD -drive file=/dev/silver/virt-win,if=virtio,format=raw,cache=writeback -drive file=/dev/silver/virt-photo,if=virtio,format=raw,cache=writeback -name $NAME -nodefaults -no-user-config -chardev pty,id=charserial0 -global PIIX4_PM.disable_s3=1 -global PIIX4_PM.disable_s4=1 -device vfio-pci,host=05:00.0,id=hostdev0,bus=pci.0,addr=0x2,multifunction=on,x-vga=on,romfile=/home/m0x35/Downloads/Palit.HD4650.1024.080923.rom -usbdevice host:$(./get_kbd.sh) -usbdevice host:$(./get_mouse.sh) -vga none -monitor $MONITOR -netdev tap,id=$IFACE,ifname=$IFACE -device virtio-net-pci,netdev=$IFACE;

