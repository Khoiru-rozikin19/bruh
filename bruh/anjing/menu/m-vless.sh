#!/bin/bash

NC='\033[0;37m'
COLOR1='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BICyan='\033[0;34m' 
BIWhite='\033[1;97m'  
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
clear
function add-vless(){
clear
domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
  echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    m-vless
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
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

vlesslink1="vless://${uuid}@bug.com:443?path=/vless&security=tls&host=${domain}&encryption=none&type=ws&sni=${domain}#${user}"
vlesslink2="vless://${uuid}@bug.com:80?path=/vless&encryption=none&type=ws&host=${domain}#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"

clear
cat >/var/www/html/vless-$user.txt <<-END

====================
BY RZK Store
wa.me/6282372838757
====================

# Format Vless WS TLS

proxies:
  - name: Vless-$user-WS TLS
    server: bug.com
    port: 443
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true
    
# Format Vless WS Non TLS

proxies:
  - name: Vless-$user-WS (CDN) Non TLS
    server: bug.com
    port: 80
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true
    
# Format Vless Grpc

proxies:
  - name: Vless-$user-WS (CDN) gRPC (SNI)
    server: ${domain}
    port: 443
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: bug.com
    network: grpc
    grpc-opts:
      grpc-service-name: vless-grpc
    udp: true

====================
Link Akun Vless 
====================
Link TLS      : 
${vlesslink1}
====================
Link none TLS : 
${vlesslink2}
====================
Link GRPC     : 
${vlesslink3}
====================


END

systemctl restart xray
systemctl restart nginx
clear
echo -e ""
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " CREATE VLESS ACCOUNT           "
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "port TLS    : 443, 8443, 2096, 2087"
echo -e "Port NTLS   : 80, 8080, 8880, 2082"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Path TLS    : /vless "
echo -e "ServiceName : vless-grpc"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link TLS    : ${vlesslink1}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link NTLS   : ${vlesslink2}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link GRPC   : ${vlesslink3}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " "
echo -e "\033[0;32m Sc RZK Store ${NC} "
echo "" 
read -n 1 -s -r -p "Press any key to back on menu"

m-vless
}

function trialvless(){
clear
domain=$(cat /etc/xray/domain)
masaaktif=1
user=Trial-VL`</dev/urandom tr -dc 0-9 | head -c3`
clear 
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e " Settings Tittle Triall         "
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e ""
echo -e ""
echo -e "\033[1;96m___________________________________________\033[0m"
read -p " Menit : " pup
echo -e "\033[1;96m___________________________________________\033[0m"
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
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
clear
vlesslink1="vless://${uuid}@bug.com:443?path=/vless&security=tls&host=${domain}&encryption=none&type=ws&sni=${domain}#${user}"
vlesslink2="vless://${uuid}@bug.com:80?path=/vless&encryption=none&type=ws&host=${domain}#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
cat >/var/www/html/vless-$user.txt <<-END

====================
BY RZK Store
wa.me/6282372838757
====================

# Format Vless WS TLS

proxies:
  - name: Vless-$user-WS TLS
    server: bug.com
    port: 443
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true
    
# Format Vless WS Non TLS

proxies:
  - name: Vless-$user-WS (CDN) Non TLS
    server: bug.com
    port: 80
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true
    
# Format Vless Grpc

proxies:
  - name: Vless-$user-WS (CDN) gRPC (SNI)
    server: ${domain}
    port: 443
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: bug.com
    network: grpc
    grpc-opts:
      grpc-service-name: vless-grpc
    udp: true

===========================
Link Akun Vless 
===========================
Link TLS      : 
${vlesslink1}
===========================
Link none TLS : 
${vlesslink2}
===========================
Link GRPC     : 
${vlesslink3}
===========================


END

systemctl restart xray
systemctl restart nginx

clear
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "    TRIALL VLESS          "
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "port TLS    : 443, 8443, 2096, 2087"
echo -e "Port NTLS   : 80, 8080, 8880, 2082"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Path TLS    : /vless "
echo -e "ServiceName : vless-grpc"
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Link TLS    : ${vlesslink1}"
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Link NTLS   : ${vlesslink2}"
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Link GRPC   : ${vlesslink3}"
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e "Aktif Selama     : $pup menit"
echo -e "\033[1;96m___________________________________________\033[0m"
echo -e ""
echo "tunnel vless ${user}" | at now +$pup minutes &> /dev/null
read -n 1 -s -r -p "Press any key to back on menu"
m-vless
}

function renewws(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
        echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "${BGWHITE}            Renew Vless            \E[0m"
        echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

	clear
	  echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "${BGWHITE}            Renew Vless            \E[0m"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
  	grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo ""
    red "Tap Enter To Go Back"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	read -rp "Input Username : " user
    if [ -z $user ]; then
    m-vless
    else
    rm -f /etc/kyt/limit/vless/ip/${user}
    rm -f /etc/vless/$user
    read -p "Expired (days): " masaaktif
    exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
if [ ! -e /etc/vless/ ]; then
  mkdir -p /etc/vless/
fi

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(( (d1 - d2) / 86400 ))
    exp3=$(($exp2 + $masaaktif))
    exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
    sed -i "/#& $user/c\#& $user $exp4" /etc/xray/config.json
    sed -i "/#& $user/c\#& $user $exp4" /root/akun/vless/.vless.conf
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo " » VLESS Account Was Successfully Renewed"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    m-vless
  fi
}
function delws() {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "${BGWHITE}        Delete Vless Account       ${NC}"
        echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo -e ""
		echo -e "Anda Tidak Memiliki Member Vless!"
		echo -e ""
		echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		read -n 1 -s -r -p "Press any key to back on menu"
        m-vless
	fi

	clear
	echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "${BGWHITE}        Delete Vless Account       ${NC}"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "USER          EXPIRED  " 
	echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo -e ""
    # red "Tap Enter To Go Back"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	read -rp "Input Username : " user
    if [ -z $user ]; then
    m-vless
    else
    exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
    sed -i "/^#& $user $exp/,/^},{/d" /etc/vless/.vless.db
    rm -rf /etc/vless/$user
    rm -rf /etc/kyt/limit/vless/ip/$user
    systemctl restart xray > /dev/null 2>&1
    clear
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "» Akun Vless Berhasil Di Hapus Sayang!"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "Client Name : $user"
    echo -e "Expired On  : $exp"
    echo -e "\033[0;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e ""
    read -n 1 -s -r -p "Press Any Key To Back"
    
    m-vless
    fi
}
function cekvless() {
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '#&' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \E[42;1;37m           CEK VLESS ACCOUNT            \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvless.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
#iplimit=$(cat /etc/kyt/limit/vless/ip/${akun})
jum2=$(cat /tmp/ipvless.txt | wc -l)
#byte=$(cat /etc/vless/${akun})
#lim=$(con ${byte})
#wey=$(cat /etc/limit/vless/${akun})
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
rm -rf /tmp/ipvless.txt
done
rm -rf /tmp/other.txt
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e " "
echo -e "\033[0;32m Sc Arya Blitar ${NC} "
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"

m-vless
}
function detailvless(){
clear
MYIP=$(wget -qO- ipv4.icanhazip.com);
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\\E[0;41;36m     Check Detail XRAY Vless     \E[0m"
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                echo "You have no existing clients!"
                clear
                exit 1
        fi

        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\\E[0;41;36m     Check Detail XRAY Vless     \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  User   Expired"
        grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
        echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(cat /etc/xray/config.json | grep '^#&' | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
uuid=$(grep "},{" /etc/xray/config.json | cut -b 11-46 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`

vlesslink1="vless://${uuid}@bug.com:443?path=/vless&security=tls&host=${domain}&encryption=none&type=ws&sni=${domain}#${user}"
vlesslink2="vless://${uuid}@bug.com:80?path=/vless&encryption=none&type=ws&host=${domain}#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"

clear
cat >/var/www/html/vless-$user.txt <<-END

====================
BY RZK Store
wa.me/6282372838757
====================

# Format Vless WS TLS

proxies:
  - name: Vless-$user-WS TLS
    server: bug.com
    port: 443
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true
    
# Format Vless WS Non TLS

proxies:
  - name: Vless-$user-WS (CDN) Non TLS
    server: bug.com
    port: 80
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true
    
# Format Vless Grpc

proxies:
  - name: Vless-$user-WS (CDN) gRPC (SNI)
    server: ${domain}
    port: 443
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: bug.com
    network: grpc
    grpc-opts:
      grpc-service-name: vless-grpc
    udp: true

====================
Link Akun Vless 
====================
Link TLS      : 
${vlesslink1}
====================
Link none TLS : 
${vlesslink2}
====================
Link GRPC     : 
${vlesslink3}
====================


END

systemctl restart xray
systemctl restart nginx
clear
echo -e ""
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " CREATE VLESS ACCOUNT           "
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "port TLS    : 443, 8443, 2096, 2087"
echo -e "Port NTLS   : 80, 8080, 8880, 2082"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Path TLS    : /vless "
echo -e "ServiceName : vless-grpc"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link TLS    : ${vlesslink1}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link NTLS   : ${vlesslink2}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link GRPC   : ${vlesslink3}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Berakhir Pada    : $exp"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " "
echo -e "\033[0;32m Sc Arya Blitar ${NC} "
echo "" 
read -n 1 -s -r -p "Press any key to back on menu"

m-vless
}
clear
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}│\e[1;97;101m                   VLESS MENU                    ${BICyan}│$NC"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${BICyan}┌───────────────────────────────────────────────┐${NC}"
echo -e "     ${COLOR1}[${BIWhite}1${COLOR1}] ${NC}Create Vless Account     "
echo -e "     ${COLOR1}[${BIWhite}2${COLOR1}] ${NC}Trial Vless Acoount     "
echo -e "     ${COLOR1}[${BIWhite}3${COLOR1}] ${NC}Delete Account Vless     "
echo -e "     ${COLOR1}[${BIWhite}4${COLOR1}] ${NC}Renew Account Vless     "
echo -e "     ${COLOR1}[${BIWhite}5${COLOR1}] ${NC}Cek User Login Account Vless     "
echo -e "     ${COLOR1}[${BIWhite}6${COLOR1}] ${NC}Cek Member Account Vless     "
echo -e "     ${COLOR1}[${BIWhite}0${COLOR1}] ${NC}Back To Menu     "
echo -e " "
echo -e "     \e[1;97;101m✶ Upload By Arya Blitar 081931615811 ✶ ${NC} "
echo -e " ${BICyan}└──────────────────────────────────────────────┘${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-vless ;;
2) clear ; trialvless ;;
3) clear ; delws;;
4) clear ; renewws ;;
5) clear ; cekvless ;;
6) clear ; detailvless ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
 m-vless.temp1.sh 