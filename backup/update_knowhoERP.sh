#!/bin/bash
# ver 0.1.01
# bjasko@bring.out.ba
# 16.08.2012

B_DATE=`date "+%d_%m_%Y_%H_%M"`

ARGS=5
BADARGS=85
PGPASSWORD="$5"
PGUSER="$4"
PGHOSTADDR="$1"
export PGPASSWORD PGUSER 
# check args

if [ $# -lt  "$ARGS" ];then
     echo ""
     echo ""
     echo "Upotreba: vidi http://redmine.bring.out.ba/issues/28899"
     echo "" 
     echo "./update_knowhowERP.sh localhost port update_file username pwd backup <<< backup je opcionalan vidi #28899 "
     echo ""
     exit $BADARGS
fi

if [ $# =  "$ARGS" ];then
     echo "update bez backupa"
     sleep 5
fi

# DB list 
DB=$(psql -lt -h $1 | egrep -v 'template[01]' | egrep -v 'postgres' | awk '{print $1}')

# napravi backup  prije update-a baze u /tmp 

backup () {
for d in $DB 
         do 
         pg_dump -h $PGHOSTADDR  $d  | gzip -c > /tmp/$B_DATE.$d.sql.gz
         echo "backup baze $d je završen, idem dalje"
done
}
$6

for d in $DB

	do
  	updater -databaseURL=//$1:$2/$d -username=$4 -passwd=$5 -file=$3 -autorun
        echo "update baze $d gotov, idem dalje...." 
done 


exit
