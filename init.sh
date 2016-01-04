#!/bin/bash
set -x

sudo brctl addbr br0
sudo ip addr add 10.0.7.1/24 dev br0
sudo ip link set br0 up
sudo dnsmasq
