#!usr/bin/bash

if [ $(pwd) != "$HOME" ]
then echo "What are you doing here? Go back HOME!" ; exit 1
else echo "$HOME" ; exit 0
fi

