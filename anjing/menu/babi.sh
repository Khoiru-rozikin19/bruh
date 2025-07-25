#!/bin/bash

BICyan='\033[1;96m'       # Cyan
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
aureb=$(cat /home/daily_reboot)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi

echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}│\e[1;97;101m                 ✶ AUTO REBOOT ✶                 ${NC}│$NC"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e "
    ${green}Example :${NC}
    0     = 12 PM
    12    = 12 AM
    13-23 = 1 AM - 11 PM
    1-11  = 1 PM - 11 AM
"
echo -e "${BICyan}┌───────────────────────────────────────────────┐${NC}"
echo ""
echo -e "     ${green}Current : $aureb $gg ${NC}"
echo -e ""
echo -e "${BICyan}└───────────────────────────────────────────────┘${NC}" 
echo -e ""
echo -e " ${BICyan}───────────────────────────────────────${NC}" 
echo -e " \e[1;97;101m✶ Upload By Arya Blitar 081931615811 ✶ ${NC} "
echo -e " ${BICyan}───────────────────────────────────────${NC}" 
echo -e ""
while :; do
  read -p "Input time auto reboot only 0 - 23 : " tr2
  [[ $tr2 =~ ^[0-9]+$ ]] || { echo -ne; continue; }
  if ((tr2 >= 0 && tr2 <= 23)); then
    echo -ne
    break
  else
    echo "Can't be more than 23"
  fi
done

if [ -z $tr2 ]; then
echo "..."
exit 0
fi

if [ $tr2 -le 11 ]
then
beha=$(cat /home/daily_reboot)
echo "$tr2" > /home/daily_reboot
cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 $tr2 * * * root /sbin/reboot
END
sed -i "/Autoreboot/c\   - Autoreboot On           : $tr2:00 AM [GMT+7]"
echo -e "${green}Successfully changed the auto reboot vps to : $tr2 AM ${NC}"
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
else
beha=$(cat /home/daily_reboot)
echo "$tr2" > /home/daily_reboot
cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 $tr2 * * * root /sbin/reboot
END
sed -i "/Autoreboot/c\   - Autoreboot On           : $tr2:00 PM  [GMT+7]"
echo -e "${green}Successfully changed the auto reboot vps to- : $tr2 PM ${NC}"
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
 babi.temp1.sh 