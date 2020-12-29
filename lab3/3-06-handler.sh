#!/bin/bash
operator="+"

Plus() {
  operator="+"
}

Multiply() {
  operator="*"
}

Goodbye() {
  exit 0
}

result=1

trap 'Plus' USR1
trap 'Multiply' USR2
trap 'Goodbye' SIGTERM

while true;
  do
  case $operator in
	"+")
	  let "result+=2"
	;;
	"*")
	  let "result*=2"
	;;
  esac

  sleep 1s
  echo $result
done
