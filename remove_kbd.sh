#!/bin/bash

kbd=$(echo "info usb" | sudo socat - UNIX-CONNECT:./win7-mon | grep -i keyboard)
dev=$(echo $kbd | sed -n -e "s/^[ ]*Device \([0-9\.]\+\).*$/\1/p")
echo "usb_del $dev" | sudo socat - UNIX-CONNECT:./win7-mon
