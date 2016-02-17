devs=(0000:05:00.0 0000:05:00.1)

set -x

for d in $devs;
do
	echo $d > /sys/bus/pci/devices/$d/driver/unbind;
done;
