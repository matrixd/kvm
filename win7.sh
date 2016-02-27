set -x

KVM_DIR=/var/lib/libvirt
IMAGE=win7.qcow2
CD=Windows7Ultimate.iso
NAME=win7
PORT=5914
RAM=5000
IFACE=win7
MONITOR=stdio
qemu-system-x86_64 -enable-kvm -m $RAM -cpu host -smp 7,cores=7 -boot d -cdrom $KVM_DIR/boot/$CD -drive file=/dev/silver/virt-win,if=virtio,format=raw,cache=writeback -drive file=/dev/silver/virt-photo,if=virtio,format=raw,cache=writeback -name $NAME -nodefaults -no-user-config -chardev pty,id=charserial0 -global PIIX4_PM.disable_s3=1 -global PIIX4_PM.disable_s4=1 -vga qxl -spice port=$PORT,disable-ticketing -monitor $MONITOR -netdev tap,id=$IFACE,ifname=$IFACE -device virtio-net-pci,netdev=$IFACE &
sleep 1
remote-viewer spice://localhost:5914
