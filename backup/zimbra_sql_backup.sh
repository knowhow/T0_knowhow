#!/bin/bash
# ver 0.1
# bjasko@bring.out.ba 
# 15.11.2011

HOME=/opt/zimbra/db_git
MYSQL=/opt/zimbra/bin/mysql
MYSQL_ROOT_PASSWORD="?" 
BCKP_HOST=backup.bring.out.ba

cd $HOME

get_mysql_root_password()
{

MYSQL_ROOT_PASSWORD=`su zimbra -c  "/opt/zimbra/bin/zmlocalconfig -s" | grep -w mysql_root_password | sed -e "s/mysql_root_password = //"`

}

set_mysql_mbox_list()
{
$MYSQL  -NB -e "show databases" | grep mbox > mysql.mbox.db.list
}

dump_mbox_databases() 
{
for db in `< mysql.mbox.db.list`;
do
    /opt/zimbra/mysql/bin/mysqldump $db -S /opt/zimbra/db/mysql.sock -u root --password=${MYSQL_ROOT_PASSWORD} >  mysql.$db.sql
    echo -e "Dumped $db\n" 
done
}

dump_zimbra_database()
{
    /opt/zimbra/mysql/bin/mysqldump zimbra -S /opt/zimbra/db/mysql.sock -u root --password=${MYSQL_ROOT_PASSWORD} >  mysql.zimbra.sql
}

git_add_commit()
{
nice -n 19 git add \*
nice -n 19 git commit -a -m "zimbra mysql auto update" 
nice -n 19 git gc
}

git_push()

{
nice -n 19 rsync -a  --delete-after --bwlimit=6024 /opt/zimbra/db_git/.git/.  root@$BCKP_HOST:/data/rsync/zimbra/db/
}

get_mysql_root_password
set_mysql_mbox_list
dump_mbox_databases
dump_zimbra_database

git_add_commit
git_push
