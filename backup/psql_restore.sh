#!/bin/bash
# ver 0.4.0
# bjasko@bring.out.ba, hernad@bring.out.ba
# 07.12.2011
# pozvi ./psql_restore.sh [hostname] [username] [dbname]  [filename]
#############################
BCKPDIR="backup/psql_dump"
PSQLHOST="$1"
PSQLUSER="$2"
PSQLFILE="$4.sql"
BACK_FILE="$4.tar.gz"
#############################



if [ -d $BCKPDIR ]; then
	echo "fajl $BCKPDIR/$BACK_FILE postoji"
else 
	mkdir -p $BCKPDIR 
fi
 

echo ""
echo "untarujem $BCKPDIR/$BACK_FILE"
echo ""


tar xvfz $BACK_FILE 


echo " PSQL restore........unesi $PSQLUSER PWD:"


pg_restore --host $PSQLHOST --username $PSQLUSER -W --dbname="$3"  $BCKPDIR/$PSQLFILE 


echo " Restore iz dumpa  $BACKFILE u $1 $3 zavrsen ........"
rm $BCKPDIR/$PSQLFILE

exit 0
