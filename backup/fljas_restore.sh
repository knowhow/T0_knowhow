#!/bin/sh
# ver 1.0
# bjasko@bring.out.ba
# backupi idu u  $1 

#system settings 
tar xfvz  $1/network.tar.gz -C / 
cp -a $1/hosts /etc/hosts  
cp -a $1/hostname  /etc/hostname  
cp -a $1/rc.local  /etc/rc.local 

#user files/settings
tar  xfvz $1/config.tar.gz -C /
tar  xfvz $1/pidgin.tar.gz -C /

##folders
tar  xfvz $1/tops.tar.gz  -C /
tar  xfvz $1/sigma.tar.gz -C /
tar  xfvz $1/wine_tremol.tar.gz -C / 
tar  xfvz $1/dosemu.tar.gz -C /
tar  xfvz $1/wine.tar.gz  -C /


exit

