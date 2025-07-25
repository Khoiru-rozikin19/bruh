#!/bin/bash

RED="\033[31m"
YELLOW="\033[33m"
NC='\e[0m'
YELL='\033[0;33m'
BRED='\033[1;31m'
GREEN='\033[0;32m'
ORANGE='\033[33m'
BGWHITE='\e[0;100;37m'

# Getting

MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
clear

purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green()  { echo -e "\\033[32;1m${*}\\033[0m"; }
red()    { echo -e "\\033[31;1m${*}\\033[0m"; }
clear

function pasang_domain() {
  echo -e " Sebelum Ganti Domain Harap Pointing Dulu Ip Vps Kalian"
  green " Ganti Domain"
  sleep 1
  read -rp " Input Subdomain Anda : " -e pp
  if [ -z $pp ]; then
      echo -e " Tidak Ada Domain Yang Di Input"
  else
  echo "$pp" > /etc/xray/domain
  echo $pp > /root/domain
      echo "IP=$pp" > /var/lib/kyt/ipvps.conf
  fi
}


function pasang_ssl() {
  green " Pasang SSL"
  sleep 1
  rm -rf /etc/xray/xray.key
  rm -rf /etc/xray/xray.crt
  domain=$(cat /etc/xray/domain)
  STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
  rm -rf /root/.acme.sh
  mkdir /root/.acme.sh
  systemctl stop $STOPWEBSERVER
  systemctl stop nginx
  systemctl stop haproxy
  curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
  chmod +x /root/.acme.sh/acme.sh
  /root/.acme.sh/acme.sh --upgrade --auto-upgrade
  /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
  /root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
  ~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
  chmod 777 /etc/xray/xray.key
  systemctl restart nginx
  systemctl restart xray
  systemctl restart haproxy
}

pasang_domain
pasang_ssl
notif_addhost

echo ""
green "Back To Menu In 2 Sec ${NC}"
sleep 2
menu addhost.temp1.sh 