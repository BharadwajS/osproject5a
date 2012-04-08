#!/bin/bash
 
# add ip / hostname separated by white space
myHost="192.168.1.133"


waittime=1

while [ 1 ]
 do
	
          ping -c 1 -w $waittime $myHost
	
            if [ $? -ne 0 ]; then
         
		      echo "Host : $myHost is down (ping failed) at $(date)"  
		     ./dns_rerouting.sh
		     /etc/init.d/bind9 restart
		      exit;
            else
            
                      echo "Connection successful $(date)"
            
            fi 

done
