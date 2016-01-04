set -x

KVM_DIR=/var/lib/libvirt
IMAGE=win7.qcow2
CD=archlinux-2015.11.01-dual.iso
NAME=win7
PORT=5914
RAM=1000
IFACE=win7
qemu-system-x86_64 -enable-kvm -m $RAM -drive file=$KVM_DIR/images/$IMAGE,if=virtio -name $NAME -no-user-config -nodefaults -global PIIX4_PM.disable_s3=1 -global PIIX4_PM.disable_s4=1 -boot menu=on,strict=on -device vfio-pci,host=05:00.0,id=hostdev0,bus=pci.0,addr=0x2,multifunction=on,x-vga=on -msg timestamp=on
