#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request : Debian 9+/Ubuntu 18.04+/20+
# Develovers » 🗽🥷🎮🧑‍💻🔫Cyberpunk🥷🧑‍💻🗽**TOpPLUG**
# Email      » tuffgamer65@gmail.com
# telegram   » https://t.me/T_OpPLUG
# whatsapp   » wa.me/+254112386921
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# 🧑‍💻🏴‍☠️🥷🗽**TOpPLUG script**🧑‍💻🏴‍☠️🥷🗽
# ==========================================
RED="\033[31m"
NC='\033[0m'
OR='\033[1;93m'
Lred='\e[91m'
LLgreen='\e[92m'
Lyellow='\e[93m'
yellow="\033[1;33m"
green="\e[92;1m"
yellow="\033[1;33m"
cyan="\033[1;36m"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
echo -e "\e[32mloading...\e[0m"
clear
echo -e "${green} Silahkan Masukin Link Backupnya "
echo " "
read -p "Backup ID : " idmu
if [[ $idmu == "" ]]; then
    echo -e "${RED} Please input Backup ID"
    exit 1
fi

link="https://drive.google.com/u/4/uc?id=${idmu}&export=download"
wget -q -O /root/cache.zip $link
unzip -o /root/cache.zip > /dev/null 2>&1
cd /root/backup &> /dev/null
cp passwd /etc/ &> /dev/null
cp group /etc/ &> /dev/null
cp shadow /etc/ &> /dev/null
cp gshadow /etc/ &> /dev/null
cp -r wireguard /etc/ &> /dev/null
cp chap-secrets /etc/ppp/ &> /dev/null
cp passwd1 /etc/ipsec.d/passwd &> /dev/null
cp akun.conf /etc/shadowsocks-libev/ &> /dev/null
cp -r geovpnstore /var/lib/ &> /dev/null
cp -r sstp /home/ &> /dev/null
cp -r xray /etc/ &> /dev/null
cp -r trojan-go /etc/ &> /dev/null
cp -r shadowsocksr /usr/local/ &> /dev/null
cp -r public_html /home/vps/ &> /dev/null
cp crontab /etc/ &> /dev/null
strt &> /dev/null
cd 
rm -r -f /root/backup/

# // Clear
clear
rm -f /root/cache.zip

# // Done
echo -e "${green} Successfull Restored Your Data !"
echo ""
echo -e "${yellow}Tips${NC}: Restart Your VPS After Restored Backup !"
echo ""  
echo ""  
