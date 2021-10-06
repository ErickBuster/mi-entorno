#!/bin/sh

ETH=$(/usr/sbin/ifconfig | grep -E "^eth" | awk '{print $1}' | tr -d ':')
if [ $ETH ]; then
	echo "%{F#2495e7} %{F#2495e7}$(/usr/sbin/ifconfig $ETH | grep "inet " | awk '{print $2}' | head -1)%{u-}"
else
	WRL=$(/usr/sbin/ifconfig | grep -E "^w" | awk '{print $1}' | tr -d ':')
	if [ $WRL ]; then
		echo "%{F#51ABE6} %{F#51ABE6}$(/usr/sbin/ifconfig $WRL | grep "inet " | awk '{print $2}' | head -1)%{u-}"
	else
		echo "%{F#B80D0D}%{u-} No Device"
	fi
fi

