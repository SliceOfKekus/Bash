#!/bin/bash

pid=$$
operator="+"
result=1

tail -f channel |

while true;
  do
  read string
  case $string in
    "QUIT")
      kill $pid
      exit 0
    ;;
    "+")
      operator="+"
    ;;
    "*")
      operator="*"
    ;;
    [0-9]*)
      case $operator in
	"+")
	  let "result+=$string"
	;;
	"*")
	  let "result*=$string"
	;;
      esac
      echo $result
    ;;
    *)
      exit 0
    ;;
  esac
done
