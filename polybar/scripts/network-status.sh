#!/bin/sh

ip=$(ifconfig wlan0 | awk '$1 == "inet" { print $2 }')
status=${#ip}

if [ $status != 0 ]
then
	echo "  $ip"
else
	echo "Disconnected"
fi
