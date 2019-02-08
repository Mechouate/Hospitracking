#!/bin/bash -x
id=$1

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ adam3 $id begin : $dat---------------------------------------------"

n=$(wc -l $id.csv)
c=$(echo $n | cut -d" " -f1)

for ((i=1,j=0; i<=c; i=i+1))
do
    rssi=$(sed -n ${i}p $id.csv)
    if ((rssi <= -20 && rssi >= -65)); then j=$((j + 1)) ; fi
done

#comment
val=$(echo "scale=0; $j * 100 / $c;" | bc)

if [ $val -ge 50 ]
then 
    status="Nah_Bereich"
    #mac adresse der Pi rausfinden von ifconfig
    pi_mac=$(ifconfig | grep 'b8:27:eb'| awk '{print $2}'| sed -n 1p)"_"$(hostname)

    #mac adresse der Beacon von die variable $id rausfilern
    b_mac=$(echo $id | cut -d"." -f2)

    #die wichtigen info zusammen fassen mac der Pi , mac der Beacon , und status
    final=$pi_mac" "$b_mac" "$status

    # comment
    #scp $id.f.csv pi@server:/home/pi
    
    ssh pi@192.168.0.112 "bash s.sh $pi_mac $b_mac $status"
fi

echo $id" c: "$c" j: "$j" val : "$val" final :"$final
cat $id.csv
rm $id.csv

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ adam3 $id ende : $dat---------------------------------------------"