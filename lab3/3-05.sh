#!/bin/bash

mkfifo channel

./3-05-handler.sh &
./3-05-gen.sh

rm channel
