set -x

systemctl start libvirtd
systemctl start virtlogd
virsh nodedev-detach pci_0000_05_00_0
virsh nodedev-detach pci_0000_05_00_1
