#!/bin/bash
# ver 0.1.01
# bjasko@bring.out.ba
# 16.08.2012

B_DATE=`date "+%d_%m_%Y_%H_%M"`

ARGS=5
BADARGS=85

# check args

if [ $# -lt  "$ARGS" ];then
     echo ""
     echo ""
     echo "Upotreba: vidi http://redmine.bring.out.ba/issues/28527 "
     echo "" 
     echo "./update_knowhowERP.sh localhost port update_file username pwd "
     echo ""
     exit $BADARGS
fi




# napravi full backup servera prije update-a baze u /tmp 

su - postgres  -c "/usr/bin/pg_dumpall | gzip -c > /tmp/$B_DATE.all.sql.gz" 

DB=$(psql -lt | egrep -v 'template[01]' | egrep -v 'postgres' | awk '{print $1}')


for d in $DB

	do
  	updater -databaseURL=//$1:$2/$d -username=$4 -passwd=$5 -file=$3 -autorun 
done 


exit
