#!/bin/bash

while true;
  do
  read string
  case $string in
	"term")
	  kill -SIGTERM $1
	  sleep 1s
	  exit 0
	;;
	"+")
	  kill -USR1 $1
	;;
	"*")
	  kill -USR2 $1
	;;
  esac
done

