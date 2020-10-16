#!/bin/bash
rm -R 2-06.txt
touch 2-06.txt

for process in $(ps ax -o pid)
do
  Pid=$(grep -s '^Pid:' /proc/$process/status | awk '{print $2}')
  mem=$(grep -s '^VmRSS:' /proc/$process/status | awk '{print $2}')

  if [[ -z $mem ]]
  then
    continue
  else
    echo "$Pid : $mem kB" >> 2-06.txt
  fi
done

echo "Info from /status:"
cat 2-06.txt | sort -rnk3 > 2-06.txt | head -n1 < 2-06.txt

echo "Info from \$ top:"
top -bn1 > 2-06.top
less 2-06.top | grep -E -s "[[:digit:]]+  [[:digit:]]+" | awk '{print $1" "$6}'| sort -rnk2 | head -n1
