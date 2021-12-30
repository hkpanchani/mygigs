#!/bin/bash 
PATH=/root/mysql_backups
BACKUPTIME=`date +%d-%m-%y-%T`

if [ ! -d $PATH ]
then
    mkdir $PATH
fi

#Mysql dump compressed
mysqldump -u <USERNAME> -p<PASSWORD> <DB_NAME> | gzip > $PATH/$BACKUPTIME-backup.sql.gz

#Auto delete files older than 30 days
find $PATH -name "*.sql.gz" -type f -mtime +30 -delete