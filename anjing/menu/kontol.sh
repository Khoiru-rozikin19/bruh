#!/bin/bash

REPO="https://raw.githubusercontent.com/Arya-Blitar22/st-pusat/main/media/"
# fixhap fix Haproxy
clear
echo -e " -------------------------"
echo -e "    Fix Haproxy & Nginx            "
echo -e " ------------------------- "
echo -e ""
echo -e " Upload By Arya Blitar 081931615811 "
echo -e ""
read -p " Masukin Domainya : " -e domain

rm -fr /etc/xray/domain
echo "${domain}" > /etc/xray/domain
systemctl stop haproxy
systemctl stop nginx
wget -O /etc/haproxy/haproxy.cfg "${REPO}haproxy.cfg" >/dev/null 2>&1
wget -O /etc/nginx/conf.d/xray.conf "${REPO}xray.conf" >/dev/null 2>&1
sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg
sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf
curl ${REPO}nginx.conf > /etc/nginx/nginx.conf

cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem

systemctl restart nginx
systemctl restart haproxy kontol.temp1.sh 