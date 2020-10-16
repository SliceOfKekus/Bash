#!/bin/bash
rm 2-07.finally
touch 2-07.temp
touch 2-07.stemp
touch 2-07.finally

for string in $(ps -axo pid)
do
  if [[ "$string" == "PID" ]]
  then
    continue
  fi

  Pid=$(grep -s "^Pid" /proc/$string/status | awk '{print $2}')
  Rchar=$(grep -s -i "rchar" /proc/$string/io | awk '{print $2}')
  if [[ -z "$Rchar" ]]
  then
    continue
  fi
  echo "$Pid $Rchar" >> 2-07.temp
done

sleep 60s

for string in $(ps -axo pid)
do
  if [[ "$string" == "PID" ]]
  then
    continue
  fi

  Pid=$(grep -s "^Pid" /proc/$string/status | awk '{print $2}')
  Rchar=$(grep -s -i "rchar" /proc/$string/io | awk '{print $2}')
  if [[ -z "$Rchar" ]]
  then
    continue
  fi
  echo "$Pid $Rchar" >> 2-07.stemp
done

while read string;
do
  Pid=$(echo $string | awk '{print $1}')
  rchar=$(echo $string | awk '{print $2}')
  secondString=$(grep -s "^$Pid " /home/user/lab2/2-07.stemp)
  if [[ $secondString ]]
  then
    secondrchar=$(echo "$secondString" | awk '{print $2}')
    if [[ "$secondrchar" -eq "$rchar" ]]
    then
      answer=0
    else
      answer=$(echo "scale=9; $secondrchar-$rchar" | bc | awk '{printf "%f", $0}')
    fi

    echo "$Pid $answer" >> 2-07.finally
  else
    continue
  fi
done < 2-07.temp

cat 2-07.finally | sort -nk2 | tail -n3
rm 2-07.*temp
