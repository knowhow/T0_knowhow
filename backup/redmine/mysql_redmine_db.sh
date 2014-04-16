#!/bin/bash
# ver 0.1 
# bjasko@bring.out.ba 
# 16.04.2014

local_dir="/home/redmine/redmine_db"
remote_dir="root@192.168.45.8:/nas_backup/redmine_backup/redmine_db"
mysql_db="redmine"
mysql_usr="root"
mysql_pwd="xxxxxxx"
mysql_dump="mysql.redmine_bring_out_ba.sql"

 
cd $local_dir



function sql_dump {


redmine_db_dump=$(mysqldump  $mysql_db  --default-character-set=utf8   -u $mysql_usr -p$mysql_pwd  > $mysql_dump)

if [ $? -eq 0 ]; then  

tar cfvz $mysql_dump.tar.gz  $mysql_dump
echo pakujem $mysql_dump
  
else  
    cat /tmp/redmine_files_rsync.log  |  mail -s "redmine_db sql dump  problem"  "cs@bring.out.ba"
fi 
 
}

function sql_rsync {


redmine_db_files=$(rsync --log-file=/tmp/redmine_db_rsync.log  -avz  --no-owner --no-group  --no-perms --delete  $local_dir   $remote_dir)
if [ $? -eq 0 ]; then  
    echo success 
    rm $mysql_dump
else  
    cat /tmp/redmine_files_rsync.log | mail -s "redmine_db files rsync problem"  "cs@bring.out.ba"
fi  

}


sql_dump
sql_rsync 


exit

