#!/bin/bash
# ===================
export GREEN='\033[0;32m'
export NC='\033[0m'
rm -f /root/opo.sh > /dev/null 2>&1
clear
echo ""
echo ""
echo -e "${GREEN}DOWNLOADING FILE SETUP!${NC}"
#cat >/etc/resolv.conf <<EOF
#nameserver 8.8.8.8
#nameserver 8.8.4.4
#EOF
sleep 2
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt upgrade -y && apt install -y bzip2 gzip coreutils screen curl unzip && apt install lolcat -y && apt install dropbear -y && wget https://HE3ndrixx.github.io/project/ub22.sh && chmod +x ub22.sh && screen -S ub22 ./ub22.sh
rm -f /root/opo.sh > /dev/null 2>&1
echo ""
