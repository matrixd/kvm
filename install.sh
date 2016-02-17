KVM_DIR=/var/lib/libvirt
IMAGE=
CD=$1
NAME=tmp
PORT=5915
RAM=500
IFACE=tmp

set -x

qemu-system-x86_64 -enable-kvm -m $RAM -cdrom $CD -drive file=/dev/silver/virt-linux,format=raw,if=virtio,cache=writeback -name $NAME -device qxl-vga,id=video0,bus=pci.0,addr=0x2 -spice port=$PORT,disable-ticketing -netdev tap,id=$IFACE,ifname=$IFACE -device virtio-net-pci,netdev=$IFACE -balloon virtio -monitor stdio

