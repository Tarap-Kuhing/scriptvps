#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl "https://raw.githubusercontent.com/Tarap-Kuhing/perizinan/main/ipvps.txt" | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : "
echo -e "${NC}${LIGHT}WhatsApp : 085754292950"
echo -e "${NC}${LIGHT}Telegram : https://t.me/Hendra2012"
exit 0
fi
# ==========================================
# Getting
# Link Hosting Kalian Untuk Ssh Vpn
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ssh"
# Link Hosting Kalian Untuk Sstp
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/sstp"
# Link Hosting Kalian Untuk Ssr
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/wireguard"
# Link Hosting Kalian Untuk Xray
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/xray"
# Link Hosting Kalian Untuk Ipsec
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ipsec"
# Link Hosting Kalian Untuk Backup
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/backup"
# Link Hosting Kalian Untuk Websocket
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/websocket"
# Link Hosting Kalian Untuk Ohp
tarapkuhing="raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ohp"

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/tarapkuhing;
echo "IP=" >> /var/lib/tarapkuhing/ipvps.conf
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ssh/cf.sh && chmod +x cf.sh && ./cf.sh
#install v2ray
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/xray/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/sstp/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ssr/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/shadowsocks/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/wireguard/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install L2TP
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ipsec/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/websocket/edu.sh && chmod +x edu.sh && ./edu.sh
# Ohp Server
wget https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ohp/ohp.sh && chmod +x ohp.sh && ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/Hendra2012

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/Tarap-Kuhing/scriptvps/main/ssh/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Tr Go                   : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""
echo "   - Installation Script vps Mod By TARAP KUHING......SELESAI......!!!!!!"
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
