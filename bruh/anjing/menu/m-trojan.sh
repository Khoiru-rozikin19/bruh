#!/bin/bash

NC='\033[0;37m'
PURPLE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BIWhite='\033[1;97m'  
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
clear
function add-tr(){
clear
source /var/lib/kyt/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
#tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " CREATE TROJAN ACCOUNT          "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
    echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
    echo -e " CREATE TROJAN ACCOUNT          "
    echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
			m-trojan
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

# Link Trojan Akun
systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bug.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"

cat >/var/www/html/trojan-$user.txt <<-END
====================
RZK Store
wa.me/082372838757
====================

# Format Trojan GO/WS

proxies:
  - name: Trojan-$user-GO/WS
    server: bug.com
    port: 443
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: ${domain}
    network: ws
    ws-opts:
      path: /trojan-ws
      headers:
        Host: ${domain}
    udp: true
    
# Format Trojan gRPC

proxies:
  - name: Trojan-$user-gRPC
    server: ${domain}
    port: 443
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: bug.com
    network: grpc
    grpc-opts:
      grpc-service-name: trojan-grpc
    udp: true
    
====================
Link Akun Trojan 
====================
Link WS          : 
${trojanlink}
====================
Link GRPC        : 
${trojanlink1}
====================

END
systemctl reload xray
systemctl reload nginx
service cron restart
trojanlink="trojan://${uuid}@bug.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"

clear
echo -e ""
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " CREATE TROJAN ACCOUNT          "
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks          : ${user}" 
echo -e "Host/IP          : ${domain}"
echo -e "port             : 443, 8443, 2096, 2087"
echo -e "Key              : ${uuid}" 
echo -e "Path             : /trojan-ws" 
echo -e "ServiceName      : trojan-grpc" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Link WS          : ${trojanlink}" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Link GRPC        : ${trojanlink1}" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo ""
echo -e "\033[0;33m┌────────────────────────────────────────┐\033[0m"
echo -e "      Autoscript By RZK Store       "
echo -e "\033[0;33m└────────────────────────────────────────┘\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

    m-trojan

}

function renewws(){
clear
#! " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
        echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "${BGWHITE}            Renew Trojan           \E[0m"
        echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		    echo ""
		    echo "You have no existing clients!"
		    echo ""
		    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        m-trojan
	fi

	clear
	  echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "${BGWHITE}            Renew Trojan           \E[0m"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo ""
    red "Tap Enter To Go Back"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	read -rp "Input Username : " user
    if [ -z $user ]; then
    m-trojan
    else
    rm -f /etc/kyt/limit/trojan/ip/${user}
    rm -f /etc/trojan/$user
    read -p "Expired (days): " masaaktif
#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(( (d1 - d2) / 86400 ))
    exp3=$(($exp2 + $masaaktif))
    exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
#! $user $exp4" /etc/xray/config.json
#! $user $exp4" /root/akun/trojan/.trojan.conf
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo " » Trojan Account Was Successfully Renewed"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-trojan
  fi
}

function trialtrojan(){
clear
domain=$(cat /etc/xray/domain)
masaaktif=1
Quota=1
iplimit=10
user=Trial-TR`</dev/urandom tr -dc 0-9 | head -c3`
clear
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " Set Expired In Minutes           "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
read -p " Menit : " pup
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
# Link Trojan Akun
systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bug.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"

cat >/var/www/html/trojan-$user.txt <<-END
====================
RZK Store
wa.me/6282372838757
====================

# Format Trojan GO/WS

proxies:
  - name: Trojan-$user-GO/WS
    server: bug.com
    port: 443
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: ${domain}
    network: ws
    ws-opts:
      path: /trojan-ws
      headers:
        Host: ${domain}
    udp: true
    
# Format Trojan gRPC

proxies:
  - name: Trojan-$user-gRPC
    server: ${domain}
    port: 443
    type: trojan
    password: ${uuid}
    skip-cert-verify: true
    sni: bug.com
    network: grpc
    grpc-opts:
      grpc-service-name: trojan-grpc
    udp: true

===========================
Link Akun Trojan 
===========================
Link WS          : 
${trojanlink}
===========================
Link GRPC        : 
${trojanlink1}
===========================

END

service cron restart
trojanlink="trojan://${uuid}@bug.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"

clear
echo -e ""
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e " TRIALL TROJAN        "
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Remarks          : ${user}" 
echo -e "Host/IP          : ${domain}"
echo -e "port             : 443, 8443, 2096, 2087"
echo -e "Key              : ${uuid}" 
echo -e "Path             : /trojan-ws" 
echo -e "ServiceName      : trojan-grpc" 
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Link WS          : ${trojanlink}" 
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Link GRPC        : ${trojanlink1}" 
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt" 
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Aktif Selama     : $pup menit"
echo -e "\033[1;96m___________________________________________\033[0m"
echo "tunnel trojan ${user}" | at now +$pup minutes &> /dev/null
echo "" 
read -n 1 -s -r -p "Press any key to back on menu"
m-trojan
}

function delws() {
clear
#! " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "${BGWHITE}         Hapus Akun Trojan         ${NC}"
        echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo ""
		echo "Anda Tidak Memiliki Member Trojan"
		echo ""
		echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		read -n 1 -s -r -p "Press any key to back"
        m-trojan
	fi

	clear
	echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "${BGWHITE}         Hapus Akun Trojan         ${NC}"
    echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "USER          EXPIRED  " 
	echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	read -rp "Ketik Usernamenya : " user
    if [ -z $user ]; then
    m-trojan
    else
#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
#! $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/### $user $exp/,/^},{/d" /etc/trojan/.trojan.db
    rm -rf /etc/trojan/$user
    rm -rf /etc/kyt/limit/trojan/ip/$user
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "» Akun Trojan Berhasil Di Hapus Sayang!"
    echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "Client Name : $user"
    echo -e "Expired On  : $exp"
    echo -e "${NC}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press Any Key To Back"
    
    m-trojan
    fi
}
function cektr() {
clear
echo -n > /tmp/other.txt
#!' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \E[42;1;37m           CEK TROJAN ACCOUNT           \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/iptrojan.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
#iplimit=$(cat /etc/kyt/limit/trojan/ip/${akun})
jum2=$(cat /tmp/iptrojan.txt | wc -l)
#byte=$(cat /etc/trojan/${akun})
#lim=$(con ${byte})
#wey=$(cat /etc/limit/trojan/${akun})
#gb=$(con ${wey})
lastlogin=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 2 | tail -1)
echo -e " \033[1;36m┌──────────────────────────────────────┐\033[0m"
printf "  %-13s %-7s %-8s %2s\n" "  UserName : ${akun}"
printf "  %-13s %-7s %-8s %2s\n" "  Login    : $lastlogin"
#printf "  %-13s %-7s %-8s %2s\n" "  Usage Quota : ${gb}" 
#printf "  %-13s %-7s %-8s %2s\n" "  Limit Quota : ${lim}" 
#printf "  %-13s %-7s %-8s %2s\n" "  Limit IP : $iplimit" 
printf "  %-13s %-7s %-8s %2s\n" "  Login IP : $jum2" 
echo -e " \033[1;36m└──────────────────────────────────────┘\033[0m"
fi 
rm -rf /tmp/iptrojan.txt
done
rm -rf /tmp/other.txt
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e " "
echo -e "\033[0;32m Sc RZK Store ${NC} "
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"

m-trojan
}

clear
echo -e "$PURPLE┌─────────────────────────────────────────────────┐${NC}"
echo -e "$PURPLE│\e[1;97;101m                   TROJAN MENU                   $PURPLE│$NC"
echo -e "$PURPLE└─────────────────────────────────────────────────┘${NC}"
echo -e " $PURPLE┌───────────────────────────────────────────────┐${NC}"
echo -e "     ${GREEN}[${BIWhite}1${GREEN}] ${NC}Create Trojan Account      "
echo -e "     ${GREEN}[${BIWhite}2${GREEN}] ${NC}Trial Account Trojan     "
echo -e "     ${GREEN}[${BIWhite}3${GREEN}] ${NC}Delete Account Trojan      "
echo -e "     ${GREEN}[${BIWhite}4${GREEN}] ${NC}Renew Account Trojan      "
echo -e "     ${GREEN}[${BIWhite}5${GREEN}] ${NC}Cek User Login Account Trojan      "
echo -e "     ${GREEN}[${BIWhite}0${GREEN}] Back To Menu     "
echo -e " "
echo -e "     \e[1;97;101m✶ Upload By RZK Store 0823728387571 ✶ ${NC} "
echo -e " ${PURPLE}└──────────────────────────────────────────────┘${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; delws ;;
4) clear ; renewws ;;
5) clear ; cektr ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
 m-trojan.temp1.sh 