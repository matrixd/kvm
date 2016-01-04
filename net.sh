#!/bin/sh
set -x

switch=br0

if [ -n "$1" ];then
        ip tuntap add $1 mode tap group kvm
        ip link set $1 up
        sleep 0.5s
        brctl addif $switch $1
        exit 0
else
        echo "Error: no interface specified"
        exit 1
fi
