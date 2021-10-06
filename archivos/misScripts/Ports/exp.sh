#!/bin/sh
#Colors
purple="\e[1;35m"
blue="\e[1;34m"
white="\e[1;37m"
yellow="\e[1;33m"
end="\e[0m"

ports="$(cat $1 | grep -oiP '\d{1,5}/open' | awk -F '/' '{print $1}' | xargs | tr ' ' ',')"
ip_target="$(cat $1 | grep -i 'host' | awk '{print $2}' | head -1)"

echo "\n${yellow}[+]Extrayendo la informacion...${end}\n" > ports.tmp
echo "\t${blue}[+]Direccion IP:${end}\t${white}$ip_target${end}" >> ports.tmp
echo "\t${blue}[+]Puertos:${end}\t\t\t${white}$ports${end}\n" >> ports.tmp

echo "$ports"| tr -d '\n' | xclip -sel clip
/bin/bat ports.tmp; rm ports.tmp
