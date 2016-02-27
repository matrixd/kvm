#!/bin/bash

devs=$(lsusb | grep "$VID:$PID")
bus=$(echo $devs | sed -n -e "s/^Bus \([0-9]\+\).*$/\1/p" | sed -n -e "s/^[0]*\([1-9]\+\)/\1/p")
dev=$(echo $devs | sed -n -e "s/^Bus [0-9]\+ Device \([0-9]\+\).*$/\1/p" | sed -n -e "s/^[0]*\([1-9]\+\)/\1/p")
echo "$bus.$dev"
