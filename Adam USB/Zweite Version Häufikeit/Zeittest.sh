#!/bin/bash -x

# Zeittest 1

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"

for ((i=1; i<=8; i++)); do ssh pi@raum${i} 'echo "$(hostname) $(hostname -I)"' ; done

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"