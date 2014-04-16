#!/bin/bash
# ver 0.1 
# bjasko@bring.out.ba 
# 15.04.2014


local_dir="/var/lib/vz/files/"
remote_dir="/nas_backup/files/redmine/"


redmine_files=$(rsync --log-file=/tmp/redmine_files_rsync.log -avz  --no-owner --no-group  --no-perms --delete  $local_dir   $remote_dir)
if [ $? -eq 0 ]; then  
    echo success  
else  
    cat /tmp/redmine_files_rsync.log | mail -s "redmine_files rsync problem"  "cs@bring.out.ba"
fi  

exit
