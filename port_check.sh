#!/bin/bash
IP="58.83.155.126"
for i in {80,9292,9898,8282,1238};
do
    Num=`nmap -sT -p $i  $IP | grep -ic open`
    if [ $Num -ne 1 ]; then
	echo  "$IP  port $i no open" | mail -s "$IP down" 15321923962@139.com
#        /root/ws/weixin.sh wangsen 1 $i
    fi
done

