#!/bin/bash
rm -R 2-05finally.txt
touch 2-05finally.txt

copyOfPreviousFile=$(cat 2-04sorted.txt)
arrayOfDifferentStrings=$(cat 2-04sorted.txt | awk '{print $3}' | uniq)

for string in $arrayOfDifferentStrings
do
  currentPPID=$(echo $string | tr -d "[a-z][A-Z]_")
  currentString=$(cat 2-04sorted.txt | grep -s "$string" | tr -d ':')
  strings=$(echo $currentString | tr ' ' '\n')
  quantity=$(cat 2-04sorted.txt | grep -c "$string")
  currentAVGART=0

  temp=$(echo "$strings" | grep "Average_Running_Time=" | tr -d "[a-z][A-Z]_=")
  for numbers in $temp
  do
    currentAVGART=$(echo "scale=9; $currentAVGART+$numbers" | bc | awk '{printf "%f", $0}')
  done

  currentAVGART=$(echo "scale=9; $currentAVGART/$quantity" | bc | awk '{printf "%f", $0}')
  echo "$currentString" >> 2-05finally.txt
  echo "Average_Sleeping_Children_of_ParentID$currentPPID is $currentAVGART" >> 2-05finally.txt
done
