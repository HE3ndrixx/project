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

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8' > /dev/null
export LANG='en_US.UTF-8' > /dev/null
export LANGUAGE='en_US.UTF-8' > /dev/null
export LC_CTYPE='en_US.utf8' > /dev/null

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} ERROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosscript.site/ambe"
export Server_URLL="raw.githubusercontent.com/HE3ndrixx/perizinan/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="🧑‍💻HE3ndrixx🧑‍💻☁️☁️☁️☁️🗽TOpPLUG🧑‍💻"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -sS ipinfo.io/ip )

# // Exporting Network Interface
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"

# // Validate Result ( 1 )
touch /etc/${Auther}/license.key
export Your_License_Key="$( cat /etc/${Auther}/license.key | awk '{print $1}' )"
export Validated_Your_License_Key_With_Server="$( curl -s https://${Server_URLL}/registered.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 1 )"
if [[ "$Validated_Your_License_Key_With_Server" == "$Your_License_Key" ]]; then
    validated='true'
else
    echo -e "${EROR} License Key Not Valid"
    exit 1
fi

# // Checking VPS Status > Got Banned / No
if [[ $IP == "$( curl -s https://${Server_URLL}/blacklist.txt | cut -d ' ' -f 1 | grep -w $IP | head -n1 )" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your VPS Has Been Banned )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ $Your_License_Key == "$( curl -s https://${Server_URLL} | cut -d ' ' -f 1 | grep -w $Your_License_Key | head -n1)" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your License Has Been Limited )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ 'Standart' == "$( curl -s https://${Server_URLL}/registered.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 8 )" ]]; then 
    License_Mode='Standart'
elif [[ Pro == "$( curl -s https://${Server_URLL}/registered.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 8 )" ]]; then 
    License_Mode='Pro'
else
    echo -e "${EROR} Please Using Genuine License !"
    exit 1
fi

# // Checking Script Expired
exp=$( curl -s https://${Server_URLL}/registered.txt | grep -w $Your_License_Key | cut -d ' ' -f 4 )
now=`date -d "0 days" +"%Y-%m-%d"`
expired_date=$(date -d "$exp" +%s)
now_date=$(date -d "$now" +%s)
sisa_hari=$(( ($expired_date - $now_date) / 86400 ))
if [[ $sisa_hari -lt 0 ]]; then
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
    echo -e "${EROR} Your License Key Expired ( $sisa_hari Days )"
    exit 1
else
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
fi
clear
date
echo ""
# =========================================

#cek port dan tampilkan

ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
open="$(cat ~/log-install.txt | grep -w "OpenSSH" | cut -d: -f2|sed 's/ //g')"
drop="$(cat ~/log-install.txt | grep -w "Dropbear" | cut -d: -f2|sed 's/ //g')"
stun="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2|sed 's/ //g')"

#input port untuk pengganti
echo -e "======================================"
echo -e ""
echo -e "Change Port $ws"
echo -e "Change Port $open"
echo -e "Change Port $drop"
echo -e "Change Port $stun"
echo -e ""
echo -e "======================================"
read -p "New Port SSH WS : " ws2
if [ -z $ws2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $ws2)
if [[ -z $cek ]]; then


#ganti port layanan
sed -i "s/$ws/$ws2/g" /etc/default/sslh
sed -i "s/$ws/$ws2/g" /etc/stunnel5/stunnel5.conf
sed -i "s/$open/$ws2/g" /root/log-install.txt
sed -i "s/$drop/$ws2/g" /root/log-install.txt
sed -i "s/$stun/$ws2/g" /root/log-install.txt
sed -i "s/   - Websocket TLS           : $ws/   - Websocket TLS           : $ws2/g" /root/log-install.txt
sed -i "s/   - OpenSSH           : $open/   - OpenSSH           : $ws2/g" /root/log-install.txt
sed -i "s/   - Dropbear           : $drop/   - Dropbear           : $ws2/g" /root/log-install.txt
sed -i "s/   - Stunnel5           : $stun/   - Stunnel5           : $ws2/g" /root/log-install.txt

iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $ws -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $ws -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $ws2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $ws2 -j ACCEPT

iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null


sed -i "s/$ws/$ws2/g" /etc/systemd/system/ws-tls.service
systemctl daemon-reload
systemctl restart sslh
systemctl restart ws-tls > /dev/null

#ganti port info

echo -e "\e[032;1mPort $ws2 modified successfully\e[0m"
else
echo "Port $ws2 is used"
fi



#done 

