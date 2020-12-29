#!/bin/bash

while true;
  do
  read string
  echo $string > channel

  if [[ $string == "QUIT" ]];
    then
    exit 0
  fi

  if [[ $string != "+" && $string != "*" && ! $string =~ [0-9]+ ]];
    then
    exit 0
  fi
done
