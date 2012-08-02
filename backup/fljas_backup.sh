#!/bin/bash
# ver 1.0
# bjasko@bring.out.ba
# backupi idu u  /var/backups/vp/
DATETIME=`date +%Y%m%d`
USER="bringout"
DEST="/var/backups/vp/$DATETIME"

# kreiraj DEST
mkdir -p $DEST

#system settings 
tar cfvz  $DEST/network.tar.gz   /etc/NetworkManager/
tar cfvz  $DEST/vpn.tar.gz   /etc/openvpn/
tar cfvz  $DEST/dosemu.tar.gz   /etc/dosemu/
tar cfvz  $DEST/purple.tar.gz   /etc/purple/
cp -a /etc/hosts  $DEST
cp -a /etc/hostname $DEST 
cp -a /etc/rc.local $DEST 

#user files/settings
tar cfvz $DEST/config.tar.gz /home/$USER/.config/
tar cfvz $DEST/pidgin.tar.gz /home/$USER/.purple/
cp -a /home/$USER/.dosemurc  $DEST

# home folders
tar cfvz $DEST/tops.tar.gz /home/$USER/tops/
tar cfvz $DEST/sigma.tar.gz /home/$USER/sigma/
tar cfvz $DEST/wine_tremol.tar.gz /home/$USER/.wine_tremol/
tar cfvz $DEST/dosemu.tar.gz /home/$USER/.dosemu/
tar cfvz $DEST/wine.tar.gz /home/$USER/.wine/


exit

