KVM_DIR=/var/lib/libvirt
IMAGE=xubuntu.qcow2
CD=archlinux-2015.11.01-dual.iso
NAME=tmp
PORT=5915
RAM=500
IFACE=tmp
qemu-system-x86_64 -enable-kvm -m $RAM -cdrom $KVM_DIR/boot/$CD -drive file=$KVM_DIR/images/$IMAGE,if=virtio -name $NAME -device qxl-vga,id=video0,ram_size=169508864,vram_size=16793600,bus=pci.0,addr=0x2 -spice port=$PORT,disable-ticketing -netdev tap,id=$IFACE,ifname=$IFACE -device virtio-net-pci,netdev=$IFACE -balloon virtio

