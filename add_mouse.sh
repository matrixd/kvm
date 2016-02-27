#!/bin/bash

echo "usb_add host:$(. ./get_mouse.sh)" | sudo socat - UNIX-CONNECT:./win7-mon
