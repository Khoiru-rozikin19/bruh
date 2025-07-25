#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
YELL='\033[0;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
BGWHITE='\e[0;100;37m'

clear 
echo -e ""
echo -e " ${NC} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e " ${NC}  \e[1;97;101m              » BANDWITH MONITOR «              ${NC}"
echo -e " ${NC} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e " ${NC} ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e " ${NC}   ${NC}[${GREEN}01${NC}]${YELL} Lihat Total Bandwith Tersisa${NC}"
echo -e " ${NC}   ${NC}[${GREEN}02${NC}]${YELL} Tabel Penggunaan Setiap 5 Menit${NC}"
echo -e " ${NC}   ${NC}[${GREEN}03${NC}]${YELL} Tabel Penggunaan Setiap Jam${NC}"
echo -e " ${NC}   ${NC}[${GREEN}04${NC}]${YELL} Tabel Penggunaan Setiap Hari${NC}"
echo -e " ${NC}   ${NC}[${GREEN}05${NC}]${YELL} Tabel Penggunaan Setiap Bulan${NC}"
echo -e " ${NC}   ${NC}[${GREEN}06${NC}]${YELL} Tabel Penggunaan Setiap Tahun${NC}"
echo -e " ${NC}   ${NC}[${GREEN}07${NC}]${YELL} Tabel Penggunaan Tertinggi${NC}"
echo -e " ${NC}   ${NC}[${GREEN}08${NC}]${YELL} Statistik Penggunaan Setiap Jam${NC}"
echo -e " ${NC}   ${NC}[${GREEN}09${NC}]${YELL} Lihat Penggunaan Aktif Saat Ini${NC}"
echo -e " ${NC}   ${NC}[${GREEN}10${NC}]${YELL} Lihat Trafik Penggunaan Aktif Saat Ini [5s]${NC}"
echo -e " ${NC}   ${NC}[${RED}0X${NC}]${RED} ComeBack Menu${NC}"
echo -e ""
echo -e "    \e[1;97;101m✶ Upload By RZK Store 082372838757 ✶ ${NC} "
echo -e " ${NC} ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e ""
read -p "  Select From Options [ 1-10 / 0X ] »» " opt

case $opt in
1)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m » TOTAL BANDWITH SERVER TERSISA « \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

2)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m » TOTAL BANDWITH SETIAP 5 MENIT « \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -5

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

3)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m   » TOTAL BANDWITH SETIAP JAM «   \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -h

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

4)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m  » TOTAL BANDWITH SETIAP HARI «   \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -d

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

5)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m  » TOTAL BANDWITH SETIAP BULAN «  \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -m

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

6)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m  » TOTAL BANDWITH SETIAP TAHUN «  \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -y

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

7)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m    » TOTAL BANDWITH TERTINGGI «   \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -t

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

8)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m » STATISTIK TERPAKAI SETIAP JAM « \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -hg

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

9)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m     » LIVE BANDWITH SAAT INI «    \e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Press [ Ctrl+C ] » To-Exit"
echo -e ""

vnstat -l

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

10)
clear 
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m» LIVE TRAFIK PENGGUNAAN BANDWITH «\e[0m"
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -tr

echo -e ""
echo -e "${ORANGE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
babi2
;;

0 | 00 | x | X | 0x | 0X)
sleep 1
menu
;;

*)
echo -e ""
echo -e " Salah Tekan Sayank !!"
sleep 1
babi2
;;
esac
 babi2.temp1.sh 