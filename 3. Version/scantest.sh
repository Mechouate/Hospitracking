#!/bin/bash -x
# scantest

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Scan Begin : $dat---------------------------------------------"

for ((i=1; i<=8; i++));
do ssh raum${i} 'bash scan1_Max.sh' & 
dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "--- Endet : $dat ---"
done; wait

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Scan Ende : $dat---------------------------------------------"