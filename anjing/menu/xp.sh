#!/bin/bash


red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
##----- Auto Remove Vmess
data=($(cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
    exp=$(grep -w "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    if [[ "$exp2" -le "0" ]]; then
        sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
        sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
    fi
done

#----- Auto Remove Vless
data=($(cat /etc/xray/config.json | grep '^#&' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
    exp=$(grep -w "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    if [[ "$exp2" -le "0" ]]; then
        sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
        sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
    fi
done

#----- Auto Remove Trojan
#!' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    if [[ "$exp2" -le "0" ]]; then
#! $user $exp/,/^},{/d" /etc/xray/config.json
#! $user $exp/,/^},{/d" /etc/xray/config.json
    fi
done

#----- Auto Remove SS
#!#' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
#!# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    if [[ "$exp2" -le "0" ]]; then
#!# $user $exp/,/^},{/d" /etc/xray/config.json
#!# $user $exp/,/^},{/d" /etc/xray/config.json
    fi
done
systemctl restart xray

##------ Auto Remove SSH
hariini=$(date +%d-%m-%Y)
cat /etc/shadow | cut -d: -f1,8 | sed /:$/d >/tmp/expirelist.txt
totalaccounts=$(cat /tmp/expirelist.txt | wc -l)
for ((i = 1; i <= $totalaccounts; i++)); do
    tuserval=$(head -n $i /tmp/expirelist.txt | tail -n 1)
    username=$(echo $tuserval | cut -f1 -d:)
    userexp=$(echo $tuserval | cut -f2 -d:)
    userexpireinseconds=$(($userexp * 86400))
    tglexp=$(date -d @$userexpireinseconds)
    tgl=$(echo $tglexp | awk -F" " '{print $3}')
    while [ ${#tgl} -lt 2 ]; do
        tgl="0"$tgl
    done
    while [ ${#username} -lt 15 ]; do
        username=$username" "
    done
    bulantahun=$(echo $tglexp | awk -F" " '{print $2,$6}')
    todaystime=$(date +%s)
    if [ $userexpireinseconds -ge $todaystime ]; then
        :
    else
        userdel --force $username
    fi
done
systemctl reload ssh
 xp.temp1.sh 