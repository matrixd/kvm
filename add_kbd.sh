#!/bin/bash

sleep 0.5
echo "usb_add host:$(. ./get_kbd.sh)" | sudo socat - UNIX-CONNECT:./win7-mon
