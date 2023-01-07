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
echo -e "${NC}${LIGHT}Please Contact Tarap Kuhing!!"
echo -e "${NC}${LIGHT}Facebook : NO"
echo -e "${NC}${LIGHT}WhatsApp : 085754292950"
echo -e "${NC}${LIGHT}Telegram : NO"
exit 0
fi
clear
source /var/lib/tarapkuhing/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray.service
trojanlink="trojan://${user}@${domain}:${tr}"
service cron restart
clear
echo -e ""
echo -e "\033[0;31m===========-XRAYS/TROJAN-===========\033[0;31m"
echo -e "\033[0;34mRemarks  : ${user}\033[0;34m"
echo -e "\033[0;34mIP/Host  : ${MYIP}\033[0;34m"
echo -e "\033[0;34mAddress  : ${domain}\033[0;34m"
echo -e "\033[0;34mPort     : ${tr}\033[0;34m"
echo -e "\033[0;34mKey      : ${user}\033[0;34m"
echo -e "\033[0;34mCreated  : $hariini\033[0;34m"
echo -e "\033[0;34mExpired  : $exp\033[0;34m"
echo -e "\033[0;31m====================================\033[0;31m"
echo -e "\033[1;33mLink TR  : ${trojanlink}\033[1;33m"
echo -e "\033[0;31m====================================\033[0;31m"
echo -e "\033[1;33mScript By TARAP KUHING\033[1;33m"
