#!/bin/sh

# Intel
# cpu_temp=+$(($(cat /sys/class/thermal/thermal_zone2/temp) / 1000))°C
# AMD
cpu_temp=$(sensors 'k10temp-pci-00c3' | awk 'NR==3 { print $2 }')
# nvidia_gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv | awk 'NR==2 { print $0 }')C
# nvidia_gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv | awk 'NR==2 { print $0 }')
amd_gpu_temp=$(sensors 'amdgpu-pci-0300' | awk 'NR==5 { print $2 }')
amd_gpu_usage=$(radeontop -d - -l 1 | awk 'NR == 2 { print $5 }' | sed 's/\,//')

mem_total=$(free --giga | awk '{ if($1 == "Mem:") print $2 }')G
mem_used=$(free --mega | awk '{ if($1 == "Mem:") print $3 }')
if (($mem_used >= 1000))
then
  mem_used=$(bc -l <<< "scale=2; $mem_used/1000")G
else
  mem_used=${mem_used}M
fi

echo "[$cpu_temp | gpu $amd_gpu_temp $amd_gpu_usage | $mem_used/$mem_total]"

