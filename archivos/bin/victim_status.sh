#!/bin/sh
ttl_victima=$(cat /home/erickbuster/.config/bin/target | awk '{print $1}')
ip_victima=$(cat /home/erickbuster/.config/bin/target | awk '{print $2}')
name_victima=$(cat /home/erickbuster/.config/bin/target | awk '{print $3}')
if [ $ip_victima ]; then
	if [ $ttl_victima -lt 65 ]; then
		if [ $name_victima ]; then
			echo "%{F#e53935}$ip_victima - $name_victima "
		else
			echo "%{F#e53935}$ip_victima - Linux "
		fi
	elif [ $ttl_victima -ge 65 ]; then
		if [ $name_victima ]; then
                        echo "%{F#e53935}$ip_victima - $name_victima "
                else
                        echo "%{F#e53935}$ip_victima - Windows "
                fi
	else
		echo " i dont know"
	fi
else
	echo "%{F#5e35b1}esperando presa... ( - )"
fi
