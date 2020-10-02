#!/bin/bash

cat /var/log/*.log | wc -l

#if i have to count all strings in ALL files in  subdirectories use this:

#grep -r "" /var/log/ | wc -l /wrong

