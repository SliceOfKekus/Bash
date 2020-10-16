#!/bin/bash
touch 2-04.txt

for directory in $(ps ax -o pid)
do
  Pid=$(grep -s "^Pid:" /proc/$directory/status | awk '{print $2}')
  PPid=$(grep -s "^PPid:" /proc/$directory/status | awk '{print $2}')
  sum_exec_runtime=$(grep -s "se.sum_exec_runtime" /proc/$directory/sched | awk '{print $3}')
  nr_switches=$(grep -s "nr_switches" /proc/$directory/sched | awk '{print $3}')

  if [[ -z $nr_switches ]]
  then
    continue
  fi
  ART=$(echo "scale=3; $sum_exec_runtime/$nr_switches" | bc | awk '{printf "%f", $0}')
  echo "ProcessID=$Pid : Parent_ProcessID=$PPid : Average_Running_Time=$ART" >> 2-04.txt
done
cat 2-04.txt | sort -V -k2 -o 2-04sorted.txt

rm -R 2-04.txt
