#!/bin/bash

#-r turns on recursive search of template
#-h helps to stop write a name of file where were took a string from
#-E to use better regualrki than -e =)

grep -r -h -E -I -o "[[:alnum:]_-]+@[[:alpha:]]+\.[[:alpha:]]+" /etc | tr "\n" "," > emails.lst
