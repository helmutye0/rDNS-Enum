#!/bin/bash

ip24=1
cidr="10.1"

while [ $ip24 -le 255 ]
do

        echo "$cidr.$ip24.0/24"
        interface=1

        while [ $interface -le 255 ]
        do
                host=""
                ip=$cidr.$ip24.$interface
                host=$(nslookup $ip | grep msufcu)
                
                if [ "$host" ]
                then
                        host=$(echo $host | cut -d "=" -f 2 | cut -d " " -f 2 | cut -d "." -f 1,2,3)
                        echo "$ip | $host" >> dns-hosts.txt
                fi
        ((interface++))
        done

        ((ip24++))

done
