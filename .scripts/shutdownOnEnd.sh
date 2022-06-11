#!/bin/sh

if [ "$EUID" -ne 0 ]
then
  echo "Please run as root"
  exit 1
fi

if ! ps --pid $1
then
  echo "No such process running"
  exit 1
fi

while true
do
  if ps --pid $1
  then
    echo "process still running"
  else
    echo $(date) > last_scheduled_shudown.txt
    shutdown -h now
  fi

  sleep 5
done
