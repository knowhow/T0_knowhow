#!/bin/bash
# ver 0.2.1
# bjasko@bring.out.ba
# 23.05.2014
# run as root, B_DIRs must be owned by postgres user

B_DIR=/var/backups/knowhowERP
B_ARH=/var/backups/knowhowERP/arhiva
B_ALL=/var/backups/knowhowERP/all
B_TEKUCA=/var/backups/knowhowERP/tekuca
B_DATE=`date "+%d_%m_%Y_%H_%M"`
B_CURR_Y=`date "+%Y"`
 


# check if destination exist & create if not 
[ -d $B_DIR ] || mkdir -p $B_DIR && chown postgres:postgres $B_DIR
[ -d $B_ARH ] || mkdir -p $B_ARH && chown postgres:postgres $B_ARH
[ -d $B_ALL ] || mkdir -p $B_ALL && chown postgres:postgres $B_ALL
[ -d $B_TEKUCA ] || mkdir -p $B_TEKUCA && chown postgres:postgres $B_TEKUCA



backup_tekuca () {
# list od DB to backup
DB=$(su - postgres -c "psql -lt" | egrep -v 'template[01]' | awk '{print $1}' | grep $B_CURR_Y 
)
for d in $DB

	do
  	su - postgres -c "/usr/bin/pg_dump $d | gzip -c > $B_TEKUCA/$B_DATE.$d.sql.gz" 

done 
 
}


backup_sve  () { 

# list od DB to backup
DB=$(su - postgres -c "psql -lt" | egrep -v 'template[01]' | awk '{print $1}')

for d in $DB

	do
  	su - postgres -c "/usr/bin/pg_dump $d | gzip -c > $B_DIR/$B_DATE.$d.sql.gz" 
 
done

} 


backup_arhiva_sve   () {
# 1st day of the month, archive backup 
DAY=`date +%d`

if [ $DAY = 30 ]
        then
        find $B_DIR/*.gz  -mtime -1 \! -type d  -exec cp -a {} $B_ARH \;

fi      

}


backup_arhiva_tekuca () {
# 1st day of the month, archive backup
DAY=`date +%d`

if [ $DAY = 30 ]
        then
        find $B_DIR/*.gz  -mtime -1 \! -type d  -exec cp -a {} $B_ARH \;

fi

}



backup_servera  () {

  su - postgres  -c "/usr/bin/pg_dumpall | gzip -c > $B_ALL/$B_DATE.all.sql.gz" 


} 


cisti_backup_tekuca () {

# delete older than n days
find $B_TEKUCA/*.gz -mtime +30 -exec rm {} \;
}




cisti_backup_sve () {

# delete older than n days
find $B_DIR/*.gz -mtime +30 -exec rm {} \;
}


remote_backup_sync  () {
 
USR=""
HOST=""
REMOTE=""

 for r in $REMOTE
       do
       cd $B_DIR
       rsync -av . $USR@$HOST:$REMOTE
 done

}




if [ "$1" = "tekuca" ];
then
    echo "tekuca backup"
    backup_tekuca
    backup_arhiva_tekuca
    cisti_backup_tekuca
    exit
fi


if [ "$1" = "sve" ]
then
    echo "backup svega"
    backup_sve
    backup_arhiva
    backup_arhiva_sve
    cisti_backup_sve
    exit
fi

if [ "$1" = "server" ];
then
    echo "server backup"
    backup_servera
    exit



else
    echo "argument ne valja koristi tekuca, sve ili server"
    exit

fi

exit
