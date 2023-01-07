#!/bin/bash
# Mod By TARAP KUHING
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
#\033[0;31m====================================================\033[0;31m
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/Tarap-Kuhing/perizinan/main/ipvps.txt | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin Dulu!!!!!!"
echo -e "${NC}${LIGHT}Facebook : NO"
echo -e "${NC}${LIGHT}WhatsApp : 085754292950"
echo -e "${NC}${LIGHT}Telegram : https://t.me/Hendra2012"
exit 0
fi
clear
source /var/lib/tarapkuhing/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-vless-nontls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$nontls?path=/vless&encryption=none&type=ws#${user}"
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "\033[0;31m===========-XRAYS/VLESS-===========\033[0;31m"
echo -e "\033[0;34mRemarks     : ${user}\033[0;34m"
echo -e "\033[0;34mIP/Host     : ${MYIP}\033[0;34m"
echo -e "Address               : ${domain}\033[0;34m"
echo -e "\033[0;34mPort TLS    : $tls\033[0;34m"
echo -e "\033[0;34mPort No TLS : $nontls\033[0;34m"
echo -e "\033[0;34mUser ID     : ${uuid}\033[0;34m"
echo -e "\033[0;34mEncryption  : none\033[0;34m"
echo -e "\033[0;34mNetwork     : ws\033[0;34m"
echo -e "\033[0;34mPath        : /vless\033[0;34m"
echo -e "\033[0;34mCreated     : $hariini"
echo -e "\033[0;34mExpired     : $exp\033[0;34m"
echo -e "\033[0;31m===================================\033[0;31m"
echo -e "\033[1;33mLink TLS    : ${xrayvless1}\033[1;33m"
echo -e "\033[0;31m===================================\033[0;31m"
echo -e "\033[1;33mLink No TLS : ${xrayvless2}\033[1;33m"
echo -e "\033[0;31m=============================================\033[0;31m"
echo -e "\033[0;33mScript By TARAP KUHING\033[0;33m"
