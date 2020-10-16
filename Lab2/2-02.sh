#!/bin/bash
ps ax | grep /sbin/ | awk '{print $1}' > PIDin2-02.txt

