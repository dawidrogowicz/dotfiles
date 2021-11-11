#!/bin/sh

while xsetroot -name "`TZ='Europe/Warsaw' date +"%a %D %H:%M"`"
do
	sleep 10
done
