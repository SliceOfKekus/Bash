#!/bin/bash

maxArraySize=$1
newmemQuantity=$2

for (( i=0; i < newmemQuantity; i++ ))
do
./newmem.bash $maxArraySize &
sleep 1s
done
