#!/bin/bash

trash=/home/user/.trash
trashLog=/home/user/.trash.log
name=$1
version=0
newName=$name"v"$version


if [ ! -d $trash ]
then
  mkdir $trash
fi

while [ -f $trash/$newName ]
do
	let "version = verison + 1"
	newName=$name"v"$version
done

ln $name $trash/$newName &&
if [ ! -f $trashLog ]
then
  touch $trashLog
fi &&
echo $(realpath $name) $newName >> $trashLog && 
rm $name
