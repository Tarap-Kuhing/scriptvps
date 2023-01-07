#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e   "$y==========================================================$wh"
echo -e   "\E[44;1;39m              ⇱ SSH & OPENVPN ⇲               \E[0m"
echo -e   "$y==========================================================$wh"
echo -e   "\033[1;33m  1.  Create SSH & OpenVPN Account\033[1;33m"
echo -e   "\033[31;1m  2.  Generate SSH & OpenVPN Trial Account\033[31;1m"
echo -e   "\033[1;33m  3.  Extending SSH & OpenVPN Account Active Life\033[1;33m"
echo -e   "\033[31;1m  4.  Check User Login SSH & OpenVPN\033[31;1m"
echo -e   "\033[1;33m  5.  Daftar Member SSH & OpenVPN\033[1;33m"
echo -e   "\033[31;1m  6.  Delete SSH & OpenVpn Account\033[31;1m"
echo -e   "\033[1;33m  7.  Delete User Expired SSH & OpenVPN\033[1;33m"
echo -e   "\033[31;1m  8.  Set up Autokill SSH\033[31;1m"
echo -e   "\033[1;33m  9.  Displays Users Who Do Multi Login SSH\033[1;33m"
echo -e   "\033[31;1m 10. Restart All Service\033[31;1m"
echo -e   "\033[1;33m 11. Menu Utama\033[1;33m"
echo -e   "\033[31;1m 12. Exit\033[31;1m"
echo -e   "$y==========================================================$wh"
echo -e   "\E[44;1;39m            ⇱ Sc By Tarap Kuhing ⇲             \E[0m"
echo -e   "$y==========================================================$wh"
read -p   "Select From Options [ 1 - 12 ] : " menu
echo -e   ""
case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
cekssh
;;
5)
member
;;
6)
delssh
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
11)
menu
;;
12)
clear
exit
;;
*)
clear
menu
;;
esac
