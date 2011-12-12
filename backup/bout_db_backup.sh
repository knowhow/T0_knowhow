#!/bin/bash
DIR=/mnt/data/backup/bringout
DATE=`date "+%Y%m%d-%H%M"`
[ ! $DIR ] && mkdir -p $DIR || :

# delete older than n days
find $DIR/*.gz -mtime +30 -exec rm {} \;

# backup DB

DB=bringout
for d in $DB
do
  su - postgres -c "/usr/bin/pg_dump $d | gzip -c > $DIR/$DATE.$d.sql.gz"
done 

cd $DIR
rsync *.sql.gz root@etc-backup.bring.out.ba:/backup/knowhow-erp.bring.out.ba/bringout/
exit

