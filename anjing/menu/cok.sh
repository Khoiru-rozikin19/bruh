#!/bin/bash

RED="\033[31m"
YELLOW="\033[33m"
NC='\e[0m'
YELL='\033[0;33m'
BRED='\033[1;31m'
GREEN='\033[0;32m'
ORANGE='\033[33m'
BGWHITE='\e[0;100;37m'
NCA='\033[00m'
clear
echo -e " ${ORANGE} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "   \e[1;97;101m          » INFORMATION PORT SERVICE «          ${NCA}"
echo -e " ${ORANGE} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e " ${ORANGE} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Open SSH                   : ${GREEN}443, 80 , 22   ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Dropbear                   : ${GREEN}443, 109, 143  ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Dropbear Websocket         : ${GREEN}443, 109       ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}SSH Websocket SSL          : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}SSH Websocket              : ${GREEN}80             ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}SSH UDP                    : ${GREEN}1-65535        ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}OpenVPN SSL                : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}OpenVPN Websocket SSL      : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}OpenVPN TCP                : ${GREEN}443, 1194      ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}OpenVPN UDP                : ${GREEN}2200           ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Nginx Webserver            : ${GREEN}443, 80, 81    ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Haproxy Loadbalancer       : ${GREEN}443, 80        ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}DNS Server                 : ${GREEN}443, 53,       ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}DNS Client                 : ${GREEN}443, 88        ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}OpenVPN Websocket SSL      : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}XRAY DNS (SLOWDNS)         : ${GREEN}443, 53        ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}XRAY Vmess TLS             : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}XRAY Vmess gRPC            : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}XRAY Vmess None TLS        : ${GREEN}80             ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}XRAY Vless TLS             : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}XRAY Vless gRPC            : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}XRAY Vless None TLS        : ${GREEN}80             ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Trojan gRPC                : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Trojan WS                  : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}Shadowsocks WS             : ${GREEN}443            ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}BadVPN 1                   : ${GREEN}7100           ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}BadVPN 2                   : ${GREEN}7200           ${ORANGE}│"
echo -e " ${ORANGE} │  ${GREEN}» ${NC}BadVPN 3                   : ${GREEN}7300           ${ORANGE}│"
echo -e " ${ORANGE} │ ${ORANGE}                                               │"
echo -e " ${ORANGE} │  \e[1;97;101m✶ Upload By Arya Blitar 081931615811 ✶ ${NC}       ${ORANGE}│"
echo -e " ${ORANGE} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo ""
read -n 1 -s -r -p "  Press Any Key To Back On Menu"
menu cok.temp1.sh 