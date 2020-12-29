#!/bin/bash

untrash()
{
  path=$1
  name=$2
  ln /home/user/.trash/$name $path ||
  echo "name's conflict." &&
  read newName &&
  untrash $1  $newName
}

if [ ! -d /home/user/.trash ]
then
  echo "trash doesn't exist."
  exit -1
fi

nameOfFile=$1
trashLog=/home/user/.trash.log

grep $nameOfFile $trashLog |
while read line;
do
  path=$(echo $line | awk '{print $1}')
  name=$(echo $line | awk '{print $2}')

  echo "Restore $name? (y/n)" &&
  read answer < /dev/tty &&
  if [[ "$answer" == "y" || "$answer" == "Y" ]]
  then
	if [[ ! -d $(dirname $path) ]]
	then
	  untrash $HOME $name &&
	  echo "Restored in $HOME"
	else
	  untrash $path $name
	fi
  else
    if [[ "$answer" == "n" || "$answer" == "N" ]]
    then
      continue
    fi
  fi

  rm /home/user/.trash/$name
done
