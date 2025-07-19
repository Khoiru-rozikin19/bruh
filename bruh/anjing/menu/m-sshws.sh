#!/bin/bash
NC='\033[0;37m' 
PURPLE='\033[0;34m' 
GREEN='\033[0;32m' 
BIWhite='\033[1;97m' 
asu='\033[1;33m' 
RED="\033[31m"
YELLOW="\033[33m"
NC='\e[0m'
YELL='\033[0;33m'
BRED='\033[1;31m'
ORANGE='\033[33m'
BGWHITE='\e[0;100;37m'
clear
function usernew(){
clear
IP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)

clear
echo -e "\033[0;34m======================\033[0m"
echo -e "   SSH Ovpn Account           "
echo -e "\033[0;34m======================\033[0m"
read -p " Username  : " Login
read -p " Password  : " Pass
read -p " Expired Days : " masaaktif

clear
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi


clear

cat > /var/www/html/ssh-$Login.txt <<-END
==========================
BY ARYA NBC
wa.me/6281931615811
==========================
Username         : $Login
Password         : $Pass
==========================
IP               : $IP
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8880, 2082
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
==========================
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
==========================
Payload WSS: GET / HTTP/1.1[crlf]Host: [host_port][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf][crlf]
==========================
OVPN Download : https://$domain:81/
==========================

END

clear
echo ""
echo -e "\033[0;34m=======================\033[0m"
echo -e "   SSH OVPN ACCOUNT    "
echo -e "\033[0;34m=======================\033[0m"
echo -e "Username         : $Login"
echo -e "Password         : $Pass"
echo -e "Host             : $domain"
#echo -e "Host Slowdns     : ${NS}"
#echo -e "Pub Key          : ${PUB}"
#echo -e "Location         : $CITY"
echo -e "Port OpenSSH     : 443, 80, 22"
#echo -e "Port DNS         : 443, 53 ,22 "
#echo -e "Port SSH UDP     : 1-65535"
echo -e "Port Dropbear    : 443, 109"
echo -e "Port SSH WS      : 80, 8080, 8880, 2082"
echo -e "Port SSH SSL WS  : 443, 8443, 2096, 2087"
echo -e "Port SSL/TLS     : 443"
echo -e "Port OVPN WS SSL : 443"
echo -e "Port OVPN SSL    : 443"
echo -e "Port OVPN TCP    : 443, 1194"
echo -e "Port OVPN UDP    : 2200"
echo -e "BadVPN UDP       : 7100-7300"
echo -e "Format Hc        : $domain:80@$Login:$Pass "
echo -e "\033[0;34m===============================\033[0m"
echo -e " "
echo -e "PAYLOD WS : GET / HTTP/1.1[crlf]Host: [host_port][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
echo -e ""
echo -e "PAYLOD WS/TLS : GET wss://[host_port]/ HTTP/1.1[crlf]Host: [host_port][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
echo -e " "
echo -e "\033[0;34m===============================\033[0m"
echo -e "OVPN Download    : https://$domain:81/"
echo -e "\033[0;34m===============================\033[0m"
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt"
echo -e "\033[0;34m===============================\033[0m"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[0;34m===============================\033[0m"
echo -e " "
echo -e "\033[0;32m Sc Arya Blitar ${NC} "
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshws

}
function trialssh(){
domain=$(cat /etc/xray/domain)
clear
#IP=$(curl -sS ipv4.icanhazip.com)
Login=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
clear
echo -e "\033[0;34m=======================\033[0m"
echo -e "   Set Trial Account           "
echo -e "\033[0;34m=======================\033[0m"
echo -e ""
read -p " Menit : " pup
echo -e "\033[0;34m=======================\033[0m"
hari="1"
Pass=1
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo ""
cat > /var/www/html/ssh-$Login.txt <<-END
===========================
Format SSH OVPN Account
===========================
Username         : $Login
Password         : $Pass
Berakhir Pada    : $pup Menit
===========================
Host             : $domain
Port OpenSSH     : 80, 22
Port Dropbear    : 443, 109
Port SSH WS      : 80, 8080
Port SSH SSL WS  : 443
Port SSL/TLS     : 443
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100-7300
===========================
Payload WS : GET / HTTP/1.1[crlf]Host: [host_port][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf][crlf] 
===========================
OVPN Download : https://$domain:81/
===========================

END
echo userdel -f "$Login" | at now + $pup minutes
echo "tunnel ssh ${Login}" | at now +$pup minutes &> /dev/null
clear
echo -e "\033[0;34m========================\033[0m"
echo -e "   Trial Ovpn Account           "
echo -e "\033[0;34m========================\033[0m"
echo -e " Username         : $Login"
echo -e " Password         : $Pass"
#echo -e " IP/Host          : $IP"
echo -e " Domain SSH       : $domain"
echo -e " OpenSSH          : 22, 80"
echo -e " Dropbear         : 143, 109"
#echo -e " Port SSH UDP     : 1-65535"
echo -e " SSL/TLS          : 443"
echo -e " SSH Ws Non SSL   : 80, 8080, 8880, 2082"
echo -e " SSH Ws SSL       : 443, 8443, 2096, 2087"
echo -e " OVPN Ws Non SSL  : 80"
echo -e " OVPN Ws SSL      : 443"
echo -e " BadVPN UDPGW     : 7100-7300"
echo -e " Format Hc        : $domain:80@$Login:$Pass "
echo -e "\033[0;34m===========================\033[0m"
echo -e " OVPN Download : https://$domain:81/"
echo -e "\033[0;34m===========================\033[0m"
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt"
echo -e "\033[0;34m===========================\033[0m"
echo -e "PAYLOD WS : GET / HTTP/1.1[crlf]Host: [host_port][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
echo -e ""
echo -e "PAYLOD WS/TLS : GET wss://[host_port]/ HTTP/1.1[crlf]Host: [host_port][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
echo -e " "
echo -e "\033[0;34m===========================\033[0m"
echo -e "Aktif Selama   : $pup menit"
echo -e "\033[0;34m===========================\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
m-sshws
}
function del(){
clear
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${PURPLE}\E[42;1;37m            MEMBER SSH OPENVPN            ${NC}"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "USERNAME          EXP DATE          "
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     "
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     "
fi
fi
done < /etc/passwd
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[42;1;37m          » DELETE SSH OPENVPN «          ${NC}"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -p "Ketik Usernamenya : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User $Pengguna Berhasil Di Hapus Sayang!"
        read -n 1 -s -r -p "Press Any Key To Back"
        m-sshws
else
        echo -e "Failure : User $Pengguna Tidak Di Temukan!"
        read -n 1 -s -r -p "Press Any Key To Back"
        m-sshws
fi
}
function autodel(){
clear
               hariini=`date +%d-%m-%Y`
               echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
               echo -e "\E[42;1;37m                AUTO DELETE               \E[0m"
               echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"  
               echo "Thank you for removing the EXPIRED USERS"
               echo -e "$PURPLE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"  
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
               echo "echo "Expired- Username : $username are expired at: $tgl $bulantahun and removed : $hariini "" >> /usr/local/bin/deleteduser
	           echo "Username $username that are expired at $tgl $bulantahun removed from the VPS $hariini"
               userdel $username
               fi
               done
               echo " "
               echo -e "$PURPLE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"  
               
               read -n 1 -s -r -p "Press any key to back on menu"
               m-sshws
        
}
function ceklim(){
clear
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[42;1;37m        CEK USER MULTILOGIN        \E[0m"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
cat /root/log-limit.txt
else
echo " No user has committed a violation"
echo " "
echo " or"
echo " "
echo " The user-limit script not been executed."
fi
echo " ";
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo " ";
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function cek(){
clear
clear
if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
                
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e " \033[0;34m ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "    ID  |  Username  |  IP Address";
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
            cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
            NUM=`cat /tmp/login-db-pid.txt | wc -l`;
            USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
            IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
            if [ $NUM -eq 1 ]; then
                    echo "    $PID - $USER - $IP";
                    fi
done
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e ""
echo -e " \033[0;34m ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "    ID  |  Username  |  IP Address";
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
            cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
            NUM=`cat /tmp/login-db-pid.txt | wc -l`;
            USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
            IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
            if [ $NUM -eq 1 ]; then
                    echo "    $PID - $USER - $IP";
        fi
done
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
echo -e ""
echo -e " \033[0;34m ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "    Username  |  IP Address  |  Connected";
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
            cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
            cat /tmp/vpn-login-tcp.txt
fi
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
echo " "
echo -e " \033[0;34m ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "    Username  |  IP Address  |  Connected";
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
            cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
            cat /tmp/vpn-login-udp.txt
fi
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo ""
echo -e " \033[0;32m Sc By Arya Blitar  ${NC}"
echo ""
read -n 1 -s -r -p "  Press Any Key To Back On Menu"
m-sshws

}
function member(){
clear
echo -e " \033[0;34m ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "    USERNAME       EXP DATE         STATUS"
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e " \033[0;34m ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
 printf "%-17s %2s %-17s %2s \n" "    $AKUN" "$exp   " "LOCKED${NORMAL}"
else
 printf "%-17s %2s %-17s %2s \n" "    $AKUN" "$exp   " "UNLOCKED${NORMAL}"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e " \033[0;34m ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "    » Account number: $JUMLAH   user"
echo -e " \033[0;34m ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e ""
read -n 1 -s -r -p "  Press any key to back"
m-sshws
}
function renew(){
clear
echo -e " \033[0;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  \E[42;1;37m              List Member SSH OPENVPN            ${NC}"
echo -e " \033[0;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  USERNAME          EXP DATE          STATUS"
echo -e " \033[0;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "  $AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "  $AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
echo -e " \033[0;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  \E[42;1;37m          Masukan Username Akun SSH OPENVPN      ${NC}"
echo -e " \033[0;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
read -p "  Username   : " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "  Day Extend : " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e " \033[0;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  \E[42;1;37m             Perpanjang Masa Aktif SSH            ${NC}"
echo -e " \033[0;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e " ${GREEN} Username   : $User"
echo -e " ${GREEN} Days Added : $Days Days"
echo -e " ${GREEN} Expires on : $Expiration_Display"
echo -e ""
echo -e " ${NC} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "  Press any key to back"
m-sshws

else
clear
echo -e " ${NC} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  \E[42;1;37m             Perpanjang Masa Aktif SSH            ${NC}"
echo -e " ${NC} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${NC} ${RED}» Username Tidak Ditemukan !"
echo -e " ${NC} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "  Press any key to back"
m-sshws
fi

}
function tendang(){
clear
MAX=1
if [ -e "/var/log/auth.log" ]; then
        OS=1;
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        OS=2;
        LOG="/var/log/secure";
fi

if [ $OS -eq 1 ]; then
	service ssh restart > /dev/null 2>&1;
fi
if [ $OS -eq 2 ]; then
	service sshd restart > /dev/null 2>&1;
fi
	service dropbear restart > /dev/null 2>&1;
				
if [[ ${1+x} ]]; then
        MAX=$1;
fi

        cat /etc/passwd | grep "/home/" | cut -d":" -f1 > /root/user.txt
        username1=( `cat "/root/user.txt" `);
        i="0";
        for user in "${username1[@]}"
			do
                username[$i]=`echo $user | sed 's/'\''//g'`;
                jumlah[$i]=0;
                i=$i+1;
			done
        cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/log-db.txt
        proc=( `ps aux | grep -i dropbear | awk '{print $2}'`);
        for PID in "${proc[@]}"
			do
                cat /tmp/log-db.txt | grep "dropbear\[$PID\]" > /tmp/log-db-pid.txt
                NUM=`cat /tmp/log-db-pid.txt | wc -l`;
                USER=`cat /tmp/log-db-pid.txt | awk '{print $10}' | sed 's/'\''//g'`;
                IP=`cat /tmp/log-db-pid.txt | awk '{print $12}'`;
                if [ $NUM -eq 1 ]; then
                        i=0;
                        for user1 in "${username[@]}"
							do
                                if [ "$USER" == "$user1" ]; then
                                        jumlah[$i]=`expr ${jumlah[$i]} + 1`;
                                        pid[$i]="${pid[$i]} $PID"
                                fi
                                i=$i+1;
							done
                fi
			done
        cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/log-db.txt
        data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
        for PID in "${data[@]}"
			do
                cat /tmp/log-db.txt | grep "sshd\[$PID\]" > /tmp/log-db-pid.txt;
                NUM=`cat /tmp/log-db-pid.txt | wc -l`;
                USER=`cat /tmp/log-db-pid.txt | awk '{print $9}'`;
                IP=`cat /tmp/log-db-pid.txt | awk '{print $11}'`;
                if [ $NUM -eq 1 ]; then
                        i=0;
                        for user1 in "${username[@]}"
							do
                                if [ "$USER" == "$user1" ]; then
                                        jumlah[$i]=`expr ${jumlah[$i]} + 1`;
                                        pid[$i]="${pid[$i]} $PID"
                                fi
                                i=$i+1;
							done
                fi
        done
        j="0";
        for i in ${!username[*]}
			do
                if [ ${jumlah[$i]} -gt $MAX ]; then
                        date=`date +"%Y-%m-%d %X"`;
                        echo "$date - ${username[$i]} - ${jumlah[$i]}";
                        echo "$date - ${username[$i]} - ${jumlah[$i]}" >> /root/log-limit.txt;
                        kill ${pid[$i]};
                        pid[$i]="";
                        j=`expr $j + 1`;
                fi
			done
        if [ $j -gt 0 ]; then
                if [ $OS -eq 1 ]; then
                        service ssh restart > /dev/null 2>&1;
                fi
                if [ $OS -eq 2 ]; then
                        service sshd restart > /dev/null 2>&1;
                fi
                service dropbear restart > /dev/null 2>&1;
                j=0;
		fi
read -n 1 -s -r -p "Press any key to back on menu"
m-sshws
}
function autokill(){
clear
rm -rf /root/log-limit.txt
touch /root/log-limit.txt
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}ON${Font_color_suffix}"
Error="${Red_font_prefix}OFF${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e ""
echo -e " ${PURPLE} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "                » Status Autokill $sts "
echo -e " ${PURPLE} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e " ${PURPLE} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e " ${PURPLE}   ${NC}[${GREEN}01${NC}]${YELL} AutoKill After 1 Minutes"
echo -e " ${PURPLE}   ${NC}[${GREEN}02${NC}]${YELL} AutoKill After 2 Minutes"
echo -e " ${PURPLE}   ${NC}[${GREEN}03${NC}]${YELL} AutoKill After 3 Minutes"
echo -e " ${PURPLE}   ${NC}[${GREEN}04${NC}]${YELL} Turn Off AutoKill/MultiLogin"
echo -e " ${PURPLE}   ${NC}[${RED}0X${NC}]${RED} Exit"
echo -e " ${PURPLE} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"                                                                                          
echo -e ""
read -p "  Select From Options [ 1-4 / 0X ] »» " AutoKill
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                read -p "  Multilogin Maximum Number Of Allowed: " max
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/1 * * * *  root /usr/local/sbin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "\033[1;93m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoKill Every     : 1 Minutes"      
                echo -e ""
                echo -e "\033[1;93m┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"
                read -n 1 -s -r -p "Press [ Enter ] to back on menu"
                autokill                                
                ;;
                2)
                echo -e ""
                read -p "  Multilogin Maximum Number Of Allowed: " max
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/2 * * * *  root /usr/local/sbin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "\033[1;93m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m"
                echo -e ""
                echo -e "        Allowed MultiLogin : $max"
                echo -e "        AutoKill Every     : 2 Minutes"
                echo -e ""
                echo -e "\033[1;93m┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"
                read -n 1 -s -r -p "Press [ Enter ] to back on menu"
                autokill
                ;;
                3)
                echo -e ""
                read -p "  Multilogin Maximum Number Of Allowed: " max
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/3 * * * *  root /usr/local/sbin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "\033[1;93m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m"
                echo -e ""
                echo -e "        Allowed MultiLogin : $max"
                echo -e "        AutoKill Every     : 3 Minutes"
                echo -e ""
                echo -e "\033[1;93m┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"
                read -n 1 -s -r -p "Press [ Enter ] to back on menu"
                autokill
                ;;
                4)
                clear
                echo > /etc/cron.d/tendang
                echo -e ""
                echo -e "\033[1;93m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m"
                echo -e ""
                echo -e "        AutoKill MultiLogin Turned Off  "
                echo -e ""
                echo -e "\033[1;93m┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"
                read -n 1 -s -r -p "Press [ Enter ] to back on menu"
                autokill
                ;;
                0 | 00 | x | X | 0x | 0X)
                clear
                menu
                ;;
        esac
read -n 1 -s -r -p "Press any key to back on menu"
m-sshws
}
clear
echo -e "${PURPLE}┌─────────────────────────────────────────────────┐${NC}"
echo -e " \e[1;97;101m                     SSH MENU                    ${PURPLE}│$NC"
echo -e "${PURPLE}└─────────────────────────────────────────────────┘${NC}"
echo -e "${PURPLE}┌───────────────────────────────────────────────┐${NC}"
echo -e "     ${asu}[${BIWhite}1${asu}]${NC}  Create Ssh Account "
echo -e "     ${asu}[${BIWhite}2${asu}]${NC}  Trial Ssh Acoount  "
echo -e "     ${asu}[${BIWhite}3${asu}]${NC}  Delete Ssh Acoount  "
echo -e "     ${asu}[${BIWhite}4${asu}]${NC}  Perpanjang Ssh Account  "
echo -e "     ${asu}[${BIWhite}5${asu}]${NC}  Cek User Login "
echo -e "     ${asu}[${BIWhite}6${asu}]${NC}  Cek User Multi Log "
echo -e "     ${asu}[${BIWhite}7${asu}]${NC}  Auto Del User Exp  "
echo -e "     ${asu}[${BIWhite}8${asu}]${NC}  Auto Kill User Ssh "
echo -e "     ${asu}[${BIWhite}9${asu}]${NC}  Cek All Member Ssh "
echo -e "     ${asu}[${BIWhite}10${asu}]${NC} Tendang User Multi"
echo -e "     ${asu}[${BIWhite}0${asu}]${NC}  Back To Menu      "
echo -e " "
echo -e "     \e[1;97;101m✶ Upload By Arya Blitar 081931615811 ✶ ${NC} "
echo -e "${PURPLE}└───────────────────────────────────────────────┘${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; usernew ;;
2) clear ; trialssh ;;
3) clear ; del ;;
4) clear ; renew;;
5) clear ; cek ;;
6) clear ; ceklim ;;
7) clear ; autodel ;;
8) clear ; autokill ;;
9) clear ; member ;;
10) clear ; tendang ;;
0) clear ; menu ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
 m-sshws.temp1.sh 