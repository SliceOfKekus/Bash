#!/bin/bash

createBackup()
{
  newDirOrNot=$1
  pathToDir=/home/user/$2

  if [[ $newDirOrNot == "newDir" ]]
  then
	mkdir $pathToDir &&
	cp /home/user/source/* $pathToDir &&
	printf "Backup created Name: $2\nCreation time: $(date +"%F")\nFiles list:\n$(ls $pathToDir)\n\n" >> /home/user/backup-report
  else
	for file in $(ls /home/user/source/)
	do
	  if [ -f $pathToDir/$file ]
	  then
	    originalSize=$(wc -c /home/user/source/$file | awk '{print $1}')
	    currentSize=$(wc -c $pathToDir/$file | awk '{print $1}')
	    sizeDiff=$(echo "$originalSize - $currentSize" | bc)
	    if [[ sizeDiff -ne 0 ]]
	    then
		mv $pathToDir/$file $pathToDir/$file.$(date +"%F")
		cp /home/user/source/$file $pathToDir
	        echo "Change in $pathToDir: added new file($file.$(date +"%F") .Time: $(date +"%F")" >> /home/user/backup-report
	    else
		continue
	    fi
	  else
	    cp /home/user/source/$file $pathToDir
	    echo "Change in $pathToDir: added a new file($file). Add time: $(date +"%F")" >> /home/user/backup-report
	  fi
	done
  fi
}


prevBackupDateTime=$(ls /home/user/ | grep -E "^Backup-{4}?-{2}?-{2}?" | sort -n -r | head -1 |
sed "s/Backup-//")

currentDateTimeSec=$(date -d $(date +'%F') +'%s')

if [[ ! -z $prevBackupDateTime ]]
then
 	prevBackupTimeSec=$(date -d $prevBackupDateTime +'%s')
	timeDiff=$(echo "($currentDateTimeSec - $prevBackupTimeSec) / 86400" | bc)
	if [[ timeDiff -lt 7 ]]
	then
		createBackup "oldDir" "Backup-$prevBackupDateTime"
	else
		createBackup "newDir" "Backup-$(date +"%F")"
  	fi
else
  createBackup "newDir" "Backup-$(date +"%F")"
fi
