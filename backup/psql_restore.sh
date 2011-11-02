#!/bin/bash
# ver 0.1
# bjasko@bring.out.ba 
# 29.10.2011
# pozvi ./psql_restore.sh [dbname]  [filename]
#############################
BCKPDIR="backup/psql_dump"
PSQLHOST="knowhow-erp.bring.out.ba"
PSQLUSER="admin"
PSQLFILE="$2.sql"
BACK_FILE="$2.tar.gz"
#############################



if [ -d $BCKPDIR ]; then
	echo "dir postoji"
else 
	mkdir -p $BCKPDIR 
fi
 

cd $BCKPDIR

echo ""
echo "raspakiram tgz"
echo ""


tar xvfz $BACK_FILE 


echo " PSQL restore........unesi $PSQLUSER PWD:"


pg_restore --host $PSQLHOST --username $PSQLUSER -W --dbname="$1"  $PSQLFILE 


echo " Restore iz dumpa  $BACKFILE u $1 zavrsen ........"

exit 0


