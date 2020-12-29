#!/bin/bash

rm -R report2.log
touch report2.log

count=0
Array=()

echo $$

while [ 1 = 1 ]
do
let count+=1
Array+=(1 2 3 4 5 6 7 8 9 10)

if (( $count % 10000 == 0 ))
then
echo "iteration: $count. Current array size: ${#Array[*]}" >> report2.log
fi

done
