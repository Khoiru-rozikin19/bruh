#!/bin/bash

rm -rf fv-dropbear.sh
apt -y remove dropbear
sleep 0.5
apt -y purge dropbear
sleep 0.5
apt-get -y --purge remove dropbear
sleep 0.5
apt-get install dropbear -y > /dev/null 2>&1
wget -O /etc/kyt.txt "https://raw.githubusercontent.com/Khoiru-rozikin19/heheboy/main/media/issue.net"
wget -q -O /etc/default/dropbear "https://raw.githubusercontent.com/Khoiru-rozikin19/heheboy/main/media/dropbear.conf"
chmod +x /etc/default/dropbear
/etc/init.d/dropbear restart
systemctl restart dropbear
rm -rf fv-dropbear.sh
sleep 2
menu ngaceng.temp1.sh 