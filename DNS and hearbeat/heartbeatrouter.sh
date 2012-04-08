#!/bin/bash

./dns_initialize.sh
/etc/init.d/bind9 restart 
./ping.sh


