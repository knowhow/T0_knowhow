#!/bin/bash
# ver 0.1
# bjasko@bring.out.ba 
# 29.10.2011
# pozvi ./psql_backup.sh [dbname]  [filename]
#############################
BCKPDIR="backup/psql_dump"
PSQLHOST="knowhow-erp.bring.out.ba"
PSQLUSER="admin"
PSQLFILE="$2.sql"
BACK_FILE="$2.tar.gz"
#############################

echo ""
echo "pravim dump"
echo ""

if [ -d $BCKPDIR ]; then
	echo "dir postoji"
else 
	mkdir -p $BCKPDIR 
fi
 

cd $BCKPDIR


echo " PSQL dump........unesi $PSQLUSER PWD:"

	 pg_dump  -h $PSQLHOST -U $PSQLUSER -W  $1   > $PSQLFILE 

echo " SQL dump zavrsen pakujem SQl dump ........"

	tar cfvz $BACK_FILE $PSQLFILE
	rm $PSQLFILE

echo " Pakovanje zavrseno brisem SQl dump ........"

echo " lista lokalnih backup-a........"


	ls -lh 


exit 0


