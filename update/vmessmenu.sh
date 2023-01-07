#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e   "$y==========================================================$wh"
echo -e   "\E[44;1;39m                 ⇱ VMESS ⇲                    \E[0m"
echo -e   "$y==========================================================$wh"
echo -e   "\033[1;33m 1. Create Account XRAYS Vmess Websocket\033[1;33m"
echo -e   "\033[0;34m 2. Delete Account XRAYS Vmess Websocket\033[0;34m"
echo -e   "\033[1;33m 3. Extending Account XRAYS Vmess Active Life\033[1;33m"
echo -e   "\033[0;34m 4. Check User Login XRAYS Vmess\033[0;34m"
echo -e   "\033[1;33m 5. Renew Certificate XRAYS Account\033[1;33m"
echo -e   "\033[0;34m 6. Menu\033[0;34m"
echo -e   "\033[1;33m 7. Exit\033[1;33m"
echo -e   "$y==========================================================$wh"
echo -e   "\E[44;1;39m            ⇱ Sc By Tarap Kuhing ⇲             \E[0m"
echo -e   "$y==========================================================$wh"
read -p   "Select From Options [ 1 - 7 ] : " menu
echo -e   ""
case $menu in
1)
addvmess
;;
2)
delvmess
;;
3)
renewvmess
;;
4)
cekvmess
;;
5)
certv2ray
;;
6)
clear
menu
;;
7)
clear
exit
;;
*)
clear
menu
;;
esac
