#!/bin/bash
# Mod By TARAP KUHING
# \033[0;31m=========================================================\033[0;31m
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# \033[0;31m=========================================================\033[0;31m
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
clear
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-$user-nontls.json
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "\033[0;31m===================-XRAYS/VMESS-===================\033[0;31m"
echo -e "\033[0;34mRemarks     : ${user}\033[0;34m"
echo -e "\033[0;34mIP/Host     : ${MYIP}\033[0;34m"
echo -e "\033[0;34mAddress     : ${domain}\033[0;34m"
echo -e "\033[0;34mPort TLS    : ${tls}\033[0;34m"
echo -e "\033[0;34mPort No TLS : ${nontls}\033[0;34m"
echo -e "\033[0;34mUser ID     : ${uuid}\033[0;34m"
echo -e "\033[0;34mAlter ID    : 0\033[0;34m"
echo -e "\033[0;34mSecurity    : auto\033[0;34m"
echo -e "\033[0;34mNetwork     : ws\033[0;34m"
echo -e "\033[0;34mPath        : /vmess\033[0;34m"
echo -e "\033[0;34mCreated     : $hariini\033[0;34m"
echo -e "\033[0;34mExpired     : $exp\033[0;34m"
echo -e "\033[0;31m===================================================\033[0;31m"
echo -e "\033[1;33mLink TLS    : ${xrayv2ray1}\033[1;33m"
echo -e "\033[0;31m===================================================\033[0;31m"
echo -e "\033[1;33mLink No TLS : ${xrayv2ray2}\033[1;33m"
echo -e "\033[0;31m===================================================\033[0;31m"
echo -e "\033[1;33mScript Mod By TARAP KUHING\033[1;33m"
