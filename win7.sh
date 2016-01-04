set -x

KVM_DIR=/var/lib/libvirt
IMAGE=win7.qcow2
CD=Windows7Ultimate.iso
NAME=win7
PORT=5914
RAM=1000
IFACE=win7
qemu-system-x86_64 -enable-kvm -m $RAM -boot d -cdrom $KVM_DIR/boot/$CD -drive file=$KVM_DIR/images/$IMAGE,if=virtio,cache=writeback -name $NAME -device qxl-vga,id=video0,ram_size=169508864,vram_size=16793600,bus=pci.0,addr=0x2 -spice port=$PORT,disable-ticketing -netdev tap,id=$IFACE,ifname=$IFACE -device virtio-net-pci,netdev=$IFACE -balloon virtio -chardev pty,id=charserial0 -device piix3-usb-uhci,id=usb,bus=pci.0,addr=0x1.0x2 -device isa-serial,chardev=charserial0,id=serial0 -device usb-tablet,id=input -curses -monitor stdio
