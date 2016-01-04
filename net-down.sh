#!/bin/sh
set -x

switch=br0

if [ -n "$1" ];then
        brctl delif $switch $1
        ip link set $1 down
        ip tuntap del $1 mode tap
        exit 0
else
        echo "Error: no interface specified"
        exit 1
fi
