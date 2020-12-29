#!/bin/bash

restore=/home/user/restore

if [[ ! -d $restore ]]
then
  mkdir $restore
fi

prevBackup=$(ls /home/user/ | grep -E "^Backup-{4}?-{2}?-{2}?" | sort -n -r | head -1)

if [[ ! -z $prevBackup ]]
then
  for file in $(ls /home/user/$prevBackup | grep -E -v "*.[0-9]{4}-[0-9]{2}-[0-9]{2}")
  do
    cp /home/user/$prevBackup/$file /home/user/restore
  done
else
 echo "No backups in /home/user/"
fi
