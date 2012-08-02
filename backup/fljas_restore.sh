#!/bin/bash
# ver 1.0
# bjasko@bring.out.ba
# backupi idu u  $1 
[[ -n "$1" ]] || { echo "Usage: ./fljas_restore.sh "lokacija backupa" "; exit 0 ; }

#system settings 
tar xfvz  $1/network.tar.gz -C / 
tar xfvz  $1/vpn.tar.gz -C /
tar xfvz  $1/purple.tar.gz -C /

cp -a $1/hosts /etc/hosts  
cp -a $1/hostname  /etc/hostname  
cp -a $1/rc.local  /etc/rc.local 

#user files/settings
tar  xfvz $1/config.tar.gz -C /
tar  xfvz $1/pidgin.tar.gz -C /
cp -a $1/.dosemurc  /home/bringout/

##folders
tar  xfvz $1/tops.tar.gz  -C /
tar  xfvz $1/sigma.tar.gz -C /
tar  xfvz $1/wine_tremol.tar.gz -C / 
tar  xfvz $1/dosemu.tar.gz -C /
tar  xfvz $1/wine.tar.gz  -C /


exit

