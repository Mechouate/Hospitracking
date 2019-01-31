#!/bin/bash -x
n=$(wc -l b.csv)
d=$(echo $n | cut -d" " -f1)
for ((i=1; i<=d; i=i+2));{ 
mac=$(sed -n ${i}p b.csv)
j=$(( $i + 1 ))
rssi=$(sed -n ${j}p b.csv)
if grep -R "$mac" "mac.csv"
then
    final=$mac" "$rssi 
echo $final >> adam.csv
fi
}