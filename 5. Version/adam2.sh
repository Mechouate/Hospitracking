#!/bin/bash -x
id=$1

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ adam2 begin : $dat---------------------------------------------"


#die variable dd enthält der anzahl der zeilen von $d
n=$(wc -l $id.csv)
c=$(echo $n | cut -d" " -f1)

for ((i=1; i<=c; i=i+2))
do
    #die variable mac enthält die gescante mac_adr
    mac=$(sed -n ${i}p $id.csv)

    #die variable j enthält der indice der rssi der gescante mac_adr
    j=$(( $i + 1 ))

    #die variable rssi enthält der value, die rssi_wert der gescante mac_adr
    rssi=$(sed -n ${j}p $id.csv)

    var=$(grep -R "$mac" "mac.csv")
    #wenn die gescante mac_adr bekannt ist ,d.h wenn mac in mac.csv ist da wird die mac und rssi in $id.1.csv gespeichert
    if [ "$var" ]; then final=$mac" "$rssi ; echo $final >> $id.0.csv ; fi
done
sort $id.0.csv > $id.1.csv
rm $id.csv
awk '{print $1}' $id.1.csv | uniq > $id.2.csv
n1=$(wc -l $id.1.csv)
c1=$(echo $n1 | cut -d" " -f1)
n2=$(wc -l $id.2.csv)
c2=$(echo $n2 | cut -d" " -f1)

for ((i=1; i<=c2; i=i+1))
do
    mac2=$(sed -n ${i}p $id.2.csv)
    for ((j=1; j<=c1; j=j+1))
    do
        mac1=$(sed -n ${j}p $id.1.csv|awk '{print $1}')
        if [ "$mac1" == "$mac2" ]; then rssi1=$(sed -n ${j}p $id.1.csv|awk '{print $2}') ; echo $rssi1 >> $id.$mac2.csv ; fi
    done
done

rm $id.1.csv
#for ((i=1; i<=c2; i=i+1))
#do
#mac2=$(sed -n ${i}p $id.2.csv)
#nohup bash adam3.sh $id.$mac2 &
#done

for ((i=1; i<=c2; i++)); do mac2=$(sed -n ${i}p $id.2.csv) ; nohup bash adam3.sh $id.$mac2 & done; wait
rm $id.2.csv
sudo mysql --user=root --password=11naima22 raum -e"select * from objekt_max;"

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ adam2 ende : $dat---------------------------------------------"