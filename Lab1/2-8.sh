#!/bin/bash
#-F'some symbol' add to list of IFS a new symbol

awk -F: '{print $1, $3}' /etc/passwd | sort -nk2

