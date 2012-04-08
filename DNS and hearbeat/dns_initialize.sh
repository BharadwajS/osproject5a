#!/bin/bash


MASTER_PATH1=/etc/bind/zones/master/db.online-exam.com
MASTER_PATH2=/etc/bind/zones/master/db.192.168.0
NAME_PATH=/etc/bind/named.conf.local
#mkdir -p zones/master

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
echo "online-exam.com.    IN      A       192.168.1.133" >> $MASTER_PATH1
echo "ns1                     IN      A       192.168.0.10" >> $MASTER_PATH1
echo "ns2                     IN      A       192.168.0.11" >> $MASTER_PATH1
echo "www                     IN      CNAME   online-exam.com." >> $MASTER_PATH1
echo "mail                    IN      A       192.168.0.10" >> $MASTER_PATH1
echo "ftp                     IN      CNAME   online-exam.com." >> $MASTER_PATH1

echo ";" >$MASTER_PATH2
echo "; BIND reverse data file for 0.168.192.in-addr.arpa" >>$MASTER_PATH2
echo ";" >>$MASTER_PATH2
echo "\$TTL    604800" >>$MASTER_PATH2
echo "0.168.192.in-addr.arpa.      IN      SOA     ns1.online-exam.com. admin.online-exam.com. (" >>$MASTER_PATH2
echo "1         ; Serial" >>$MASTER_PATH2                          
echo "3h       ; Refresh after 3 hours" >>$MASTER_PATH2                          
echo "1h       ; Retry after 1 hour" >>$MASTER_PATH2   
echo "1w       ; Expire after 1 week" >>$MASTER_PATH2  
echo "1h )     ; Negative caching TTL of 1 day" >>$MASTER_PATH2   
echo ";" >>$MASTER_PATH2
echo "0.168.192.in-addr.arpa.       IN      NS      ns1.online-exam.com." >>$MASTER_PATH2
echo "0.168.192.in-addr.arpa.       IN      NS      ns2.online-exam.com." >>$MASTER_PATH2
echo "10.0.168.192.in-addr.arpa.   IN      PTR     online-exam.com." >>$MASTER_PATH2

echo "zone \"online-exam.com\" {" >$NAME_PATH 
echo "type master;" >>$NAME_PATH       
echo "file \"/etc/bind/zones/master/db.online-exam.com\";" >>$NAME_PATH       
echo "};" >>$NAME_PATH

echo "zone \"0.168.192.in-addr.arpa\" {" >>$NAME_PATH
echo "type master;" >>$NAME_PATH       
echo "file \"/etc/bind/zones/master/db.192.168.0\";" >>$NAME_PATH       
echo "};" >>$NAME_PATH 

                          
                       
                          









