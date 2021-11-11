#!/bin/sh


while true
do
  cpu_temp=$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C

  mem_total=$(free --giga | awk '{ if($1 == "Mem:") print $2 }')G
  mem_used=$(free --mega | awk '{ if($1 == "Mem:") print $3 }')
  if (($mem_used >= 1000))
  then
    mem_used=$(bc -l <<< "scale=2; $mem_used/1000")G
  else
    mem_used=${mem_used}M
  fi

  datetime=$(TZ='Europe/Warsaw' date +"%a %D %H:%M")

  xsetroot -name "$cpu_temp | $mem_used/$mem_total | $datetime"
	
  sleep 2
done
