set -x

mount -t ntfs-3g -o offset=$((512*2048)) /dev/silver/virt-photo /mnt/photo
