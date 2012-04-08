#!/bin/bash

MASTER_PATH1=/etc/bind/zones/master/db.online-exam.com

echo ";" > $MASTER_PATH1
echo "; BIND data file for online-exam.com" >> $MASTER_PATH1
echo ";" >> $MASTER_PATH1
echo "\$TTL    3h" >> $MASTER_PATH1
echo "@       IN      SOA     ns1.online-exam.com. admin.online-exam.com. (" >> $MASTER_PATH1
echo "1        ; Serial" >> $MASTER_PATH1
echo "   3h       ; Refresh after 3 hours" >> $MASTER_PATH1
echo "   1h       ; Retry after 1 hour" >> $MASTER_PATH1
echo "   1w       ; Expire after 1 week" >> $MASTER_PATH1
echo "   1h )     ; Negative caching TTL of 1 day" >> $MASTER_PATH1
echo ";" >> $MASTER_PATH1
echo "@       IN      NS      ns1.online-exam.com." >> $MASTER_PATH1
echo "@       IN      NS      ns2.online-exam.com." >> $MASTER_PATH1
echo "online-exam.com.    IN      MX      10      mail.online-exam.com." >> $MASTER_PATH1
echo "online-exam.com.    IN      A       10.100.100.163" >> $MASTER_PATH1
echo "ns1                     IN      A       192.168.0.10" >> $MASTER_PATH1
echo "ns2                     IN      A       192.168.0.11" >> $MASTER_PATH1
echo "www                     IN      CNAME   online-exam.com." >> $MASTER_PATH1
echo "mail                    IN      A       192.168.0.10" >> $MASTER_PATH1
echo "ftp                     IN      CNAME   online-exam.com." >> $MASTER_PATH1
