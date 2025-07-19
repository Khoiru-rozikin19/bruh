#!/bin/bash

clear
y='\033[1;33m'
BGX="\033[42m"
CYAN="\033[96m"
z="\033[95;1m"
f="\033[1;97;41m"
G="\033[92m"
RED='\033[0;31m'
BRED='\033[0;32m'
NC='\033[0;34m'
gray="\e[1;30m"
Blue="\033[0;34m"
bblue="\033[1;36m"
green='\033[0;32m'
GREEN='\033[0;32m'
grenbo="\e[92;1m"
pr="\033[0;95m"
YELL='\033[0;33m'
orange='\033[33m'
mg='\033[35m'
white='\033[0;37m'
bwhite='\033[1;37m'
NCA='\033[1;37m'

# underline
UPU='\033[5;35m'
UCY='\033[5;36m'
UWH='\033[5;37m'

IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d-%m-%Y')
TIMEZONE=$(printf '%(%H-%M-%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
clear
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
#ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="$NCA\033[42mON${NC}"
else
   status_ssh="${RED}OFF${NC}"
fi

# SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="$NCA\033[42mON${NC}"
else
    status_ws_epro="${RED}OFF${NC}"
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="$NCA\033[42mON${NC}"
else
   status_haproxy="${RED}OFF${NC}"
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="$NCA\033[42mON${NC}"
else
   status_xray="${RED}OFF${NC}"
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="$NCA\033[42mON${NC}"
else
   status_nginx="${RED}OFF${NC}"
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="$NCA\033[42mON${NC}"
else
   status_dropbear="${RED}OFF${NC}"
fi

# // Log account
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
#! " "/etc/xray/config.json")
let trb=$trx/2
#!# " "/etc/xray/config.json")
let ssa=$ssx/2

#a="ACCOUNT PREMIUM" 
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m${NC}"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m${NC}"

clear
echo -e ""
echo -e "\E[44;1;39m ꧁࿇ SCRIPT HASIL NYOLONG REPO ORANG ࿇꧂ \E[0m"
echo -e ""
echo -e " ${NC} ╭═════════════════════════════════════════════════════════╮"
echo -e " ${NC} │\e[1;97;101m        ✶ WELCOME TO AUTOSCRIPT PREMIUM BY RZK ✶        ${NC}│${NC}"
echo -e " ${NC} ╰═════════════════════════════════════════════════════════╯"
echo -e " ${NC} ╭════════════════════════════════════════════════╮"
#echo -e " ${NC} │$YELL » \033[1;36mSERVER VPS ${YELL} : ${NCA}$ISP ${NC}"
echo -e " ${NC} │$YELL » \033[1;36mSYSTEM VPS ${YELL} : ${NCA}$MODEL${NC}"
echo -e " ${NC} │$YELL » \033[1;36mRAM SERVER ${YELL} : ${NCA}$uram / $tram MB ${NC}"
echo -e " ${NC} │$YELL » \033[1;36mCORE SYSTEM${YELL} : ${NCA}$CORE ${NC}"
echo -e " ${NC} │$YELL » \033[1;36mLOAD CPU ${YELL}   : ${NCA}$LOADCPU %${NC}"
echo -e " ${NC} │$YELL » \033[1;36mDATE ${YELL}       : ${NCA}$DATEVPS${NC}"
echo -e " ${NC} │$YELL » \033[1;36mTIME ${YELL}       : ${NCA}$TIMEZONE${NC}"
echo -e " ${NC} │$YELL » \033[1;36mUPTIME ${YELL}     : ${NCA}$SERONLINE${NC}"
echo -e " ${NC} │$YELL » \033[1;36mIP VPS ${YELL}     : ${NCA}$IPVPS${NC}"
echo -e " ${NC} │$YELL » \033[1;36mDOMAIN ${YELL}     : ${NCA}$domain${NC}"
echo -e " ${NC} ╰════════════════════════════════════════════════╯"
echo -e " ${NC}               ${KIRI} ${NCA}INFORMATION ACCOUNT ${KANAN}"
echo -e " ${NC}       ════════════════════════════════════════════"
echo -e "                ${BRED} SSH/OPENVPN      $YELL:$NCA $ssh1  ${YELL}$a"
echo -e "                ${BRED} VMESS/WS/GRPC    $YELL:$NCA $vma  ${YELL}$a"
echo -e "                ${BRED} VLESS/WS/GRPC    $YELL:$NCA $vla  ${YELL}$a"
echo -e "                ${BRED} TROJAN/WS/GRPC   $YELL:$NCA $trb  ${YELL}$a"
echo -e "                ${BRED} SHADOW/WS/GRPC   $YELL:$NCA $ssa  ${YELL}$a"
echo -e " ${NC}       ════════════════════════════════════════════"
echo -e " ${NC}            ${KIRI} ${NCA}STATUS RUNNING & MENU VPS ${KANAN}"
echo -e " ${NC} ╭══════════════════╮╭═══════════════════╮╭═════════════════╮$NC"
echo -e " ${NC} │  ${NCA}SSH     : $status_ssh       ${NCA}NGINX : $status_nginx         ${NCA}HAPROXY  : $status_haproxy     ${NC}│${NC}"
echo -e " ${NC} │  ${NCA}WS-ePro : $status_ws_epro       ${NCA}XRAY  : $status_xray         ${NCA}DROPBEAR : $status_dropbear     ${NC}│${NC}"
echo -e " ${NC} ╰══════════════════╯╰═══════════════════╯╰═════════════════╯$NC"
echo -e " ${NC} ╭══════════════════════════════════════════════════════════╮"
echo -e " ${NC} │$YELL [${BRED}01$YELL]${NCA} MENU SSH     $NC│ $YELL[${BRED}09$YELL]${NCA} AUTO REBOOT $NC│ $YELL[${BRED}17$YELL]${NCA} REBOOT VPS${NC}   │${NC}"
echo -e " ${NC} │$YELL [${BRED}02$YELL]${NCA} MENU VMESS   $NC│ $YELL[${BRED}10$YELL]${NCA} INFO PORT   $NC│ $YELL[${BRED}18$YELL]${NCA} RESTAR SERVIS${NC}│$NC"    
echo -e " ${NC} │$YELL [${BRED}03$YELL]${NCA} MENU VLESS   $NC│ $YELL[${BRED}11$YELL]${NCA} SPEEDTEST   $NC│$YELL [${BRED}19$YELL]${NCA} CANGE DOMAIN ${NC}│$NC"   
echo -e " ${NC} │$YELL [${BRED}04$YELL]${NCA} MENU TROJAN  $NC│ $YELL[${BRED}12$YELL]${NCA} CEK RUNNING $NC│$YELL [${BRED}20$YELL]${NCA} CERT SSL     ${NC}│$NC" 
echo -e " ${NC} │$YELL [${BRED}05$YELL]${NCA} MENU SHADOW  $NC│ $YELL[${BRED}13$YELL]${NCA} CLEAR LOG   $NC│ $YELL[${BRED}21$YELL]${NCA} CHANGE BANNER${NC}│$NC"
echo -e " ${NC} │$YELL [${BRED}06$YELL]${NCA} FIX HAPROXY  $NC│ $YELL[${BRED}14$YELL]${NCA} CLEAR CACHE $NC│ $YELL[${BRED}22$YELL]${NCA} RESTART BANER${NC}│$NC"
echo -e " ${NC} │$YELL [${BRED}07$YELL]${NCA} CEK USAGE VPS$NC│ $YELL[${BRED}15$YELL]${NCA} SET JAM RSET$NC│$YELL [${BRED}23$YELL]${NCA} CEK BANDWITH ${NC}│$NC"
echo -e " ${NC} │$YELL [${BRED}08$YELL]${NCA} DELL ALL EXP $NC│ $YELL[${BRED}16$YELL]${NCA} MENU BACKUP $NC│$YELL [${BRED}24$YELL]${NCA} FIX DROPBEAR ${NC}│$NC"
echo -e " ${NC} ╰══════════════════════════════════════════════════════════╯"
echo -e "${NC} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}  ${RED}▁ ${CYAN}▂ ${GREEN}▄ ${ORANGE}▅${PINK} ▆${GREEN} ▇ ${RED}█${BLUE}𒆜${CYAN} ༻${NCA}  SCRIPT ARYA BLITAR ${BLUE}༺ ${RED}𒆜${GREEN}█ ${ORANGE}▇ ${CYAN}▆ ${RED}▅ ${GREEN}▄ ${ORANGE}▂ ${PINK}▁\E[0m"
echo -e "${NC} └─────────────────────────────────────────────────────┘${NC}"
echo -e " ${NC} ╭═════════════════════════════════════════════════╮"
echo -e " ${NC} │$NCA Script Upload By RZK Store 082372838757 "
echo -e " ${NC} ╰═════════════════════════════════════════════════╯${NCA}"
echo -e " "
read -p "  Select From Options [ 1-24 ] »» " opt

case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
kontol
;;
7 | 07)
clear
gotop
echo ""
echo -e " ${green} Back To Menu In 2 Sec ${NC}"
sleep 2
menu
;;
8 | 08)
clear
xp
echo ""
echo -e " ${green} Back To Menu In 2 Sec ${NC}"
sleep 2
menu
;;
9 | 09)
clear
autoreboot
;;
10)
clear
cok
echo ""
read -n 1 -s -r -p "Press Any Key To Back On Menu"
menu
;;
11)
clear
speedtest
echo ""
read -n 1 -s -r -p "Press Any Key To Back On Menu"
menu
;;
12)
clear
run
;;
13)
clear
clearlog
;;
14)
clear
clearcache
;;
15)
clear
babi
;;
16)
clear
menu-backup
;;
17)
clear
reboot
;;
18)
clear
restart
;;
19)
clear
addhost
;;
20)
clear
fixcert
;;
21)
clear
nano /etc/issue.net
;;
22)
clear
/etc/init.d/dropbear restart
;;
23)
clear
babi2
;;
24)
clear
ngaceng
;;
27)
clear
cat /etc/user-create/user.log
echo ""
read -p "Press enter Back To menu"
menu
;;
0 | 00)
exit
;;
x)
menu
;;
*) clear ;
echo -e ""
menu
;;
esac

 menu.temp1.sh 