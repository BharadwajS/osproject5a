#!/bin/bash

sudo ifconfig eth0 10.100.100.28 netmask 255.255.255.0 up
sudo ifconfig wlan0 192.168.1.28 netmask 255.255.255.0 up

# router------wired====eth0     wireless====wlan0   wireless_interface_addr====10.100.100.28,    wired_interface_addr====192.168.1.28
# main server--------wireless====eth1      wl_addr=====192.168.1.163
# hotstandby server-------hotstandby====eth0       wired_addr====10.100.100.144


#sudo route add -host 10.100.100.163 gw 10.100.100.28
#sudo route add -host 192.168.1.133 gw 192.168.1.28
#sudo iptables -A FORWARD -s 192.168.1.28 -i wlan0 -d 10.100.100.28 -o eth0 -j ACCEPT
#sudo iptables -A FORWARD -s 10.100.100.28 -i eth0 -d 192.168.1.28 -o wlan0 -j ACCEPT
sudo iptables -A FORWARD -s 192.168.1.133 -i wlan0 -d 10.100.100.163 -o eth0 -j ACCEPT
sudo iptables -A FORWARD -s 10.100.100.163 -i eth0 -d 192.168.1.133 -o wlan0 -j ACCEPT



sudo sysctl -w net.ipv4.ip_forward=1

