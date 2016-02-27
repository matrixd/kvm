#!/bin/bash

mouse=$(echo "info usb" | sudo socat - UNIX-CONNECT:./win7-mon | grep -i mouse)
dev=$(echo $mouse | sed -n -e "s/^[ ]*Device \([0-9\.]\+\).*$/\1/p")
echo "usb_del $dev" | sudo socat - UNIX-CONNECT:./win7-mon
