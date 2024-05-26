#!/bin/bash
subnet="192.168.1"
## scripting is now ruuning 
for ip in {1..255}
do
    if ping -c 1 -W 1 ${subnet}.${ip} &> /dev/null; then
        echo "Host ${subnet}.${ip} is up"
    else   
        echo "Host ${subnet}.${ip} is down" 
    fi
done


