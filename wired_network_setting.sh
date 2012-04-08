#!/bin/bash

sudo ifconfig eth0 10.100.100.163 netmask 255.255.255.0 up

sudo route add -host 192.168.1.52 gw 10.100.100.28
sudo route add -host 192.168.1.133 gw 10.100.100.28



