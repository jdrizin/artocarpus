#!/bin/sh

backupDir=/home/josh/backups

# backup the database
myDate=$(date '+%Y-%m-%d')
dbName=artocarpus-$myDate.sql
cd /tmp
mysqldump -u artoadmin -partopass artocarpus > $dbName
gzip $dbName
mv $dbName.gz $backupDir
