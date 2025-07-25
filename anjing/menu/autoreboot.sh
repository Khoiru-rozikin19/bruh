#!/bin/bash
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
echo 'echo "Sucsesfully Reboot On $tanggal Time $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
fi
clear
echo -e ""
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│\e[1;97;101m           MENU MANAGER AUTOREBOOT        $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${green}1.${NC} \033[0;36mSet Auto-Reboot 1 Hour Period"
echo -e "\033[1;93m│  ${green}2.${NC} \033[0;36mSet Auto-Reboot 6 Hour Period"
echo -e "\033[1;93m│  ${green}3.${NC} \033[0;36mSet Auto-Reboot 12 Hour Period"
echo -e "\033[1;93m│  ${green}4.${NC} \033[0;36mSet Auto-Reboot 1 Day Period"
echo -e "\033[1;93m│  ${green}5.${NC} \033[0;36mSet Auto-Reboot 1 Week Period"
echo -e "\033[1;93m│  ${green}6.${NC} \033[0;36mSet Auto-Reboot 1 Month Period"
echo -e "\033[1;93m│  ${green}7.${NC} \033[0;36mDeactivate Auto-Reboot"
echo -e "\033[1;93m│  ${green}8.${NC} \033[0;36mSee Reboot Log"
echo -e "\033[1;93m│  ${green}9.${NC} \033[0;36mDelete Reboot Log"
echo -e "\033[1;93m│  ${green}0.${NC} \033[0;36mBACK TO EXIT MENU \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC \E[0m\033[0;34m "
echo -e "\033[1;93m│  $NC "
echo -e "\033[1;93m│  \e[1;97;101m✶ Upload By RZK Store 082372838757 ✶ ${NC} "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1 | 01)
clear
echo "59 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "Auto-Reboot Sucsesfully Set \e[32m1 Hour Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
2 | 02)
clear
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "Auto-Reboot Sucsesfully Set \e[32m6 Hour Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
3 | 03)
clear
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "Auto-Reboot Sucsesfully Set \e[32m12 Hour Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
4 | 04)
clear
echo "0 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "Auto-Reboot Sucsesfully Set \e[32m1 Day Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
5 | 05)
clear
echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "Auto-Reboot Sucsesfully Set \e[32m1 Week Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
6 | 06)
clear
echo "10 0 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo -e "Auto-Reboot Sucsesfully Set \e[32m1 Month Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
7 | 07)
clear
rm -f /etc/cron.d/reboot_otomatis
echo -e "Auto-Reboot Sucsesfully \e[31mDeactivated ..!\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
8 | 08)
clear
if [ ! -e /root/log-reboot.txt ]; then
	echo "No Activity Found"
  echo -e "\033[1;93m======================================\033[0m"
	else 
	#echo ' LOG REBOOT |'
	echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m               LOG TIME REBOOT            $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
	echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
cat /root/log-reboot.txt
 echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
 echo -e "\033[1;93m======================================\033[0m"
fi
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
9 | 09)
clear
echo "" > /root/log-reboot.txt
echo -e "Auto Reboot Log Sucsesfully \e[31mDeleted ..!\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autoreboot
;;
0 | 00)
clear
menu
;;
x)
exit
;;
*)
echo -e ""
autoreboot
;;
esac
 autoreboot.temp1.sh 