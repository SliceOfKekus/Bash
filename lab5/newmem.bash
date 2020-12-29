#!/bin/bash

maxArraySize=$1

count=0
Array=()

echo $$

while [[ "${#Array[*]}" -lt "$maxArraySize" ]]
do
let count+=1
Array+=(1 2 3 4 5 6 7 8 9 10)
done
