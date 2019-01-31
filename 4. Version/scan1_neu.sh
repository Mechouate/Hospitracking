#!/bin/bash -x

dat=$(date '+%Y-%m-%d %H:%M:%S')
id=`date +%s`
echo "------------------------------------ scan begin : $dat-----------------------------------------------------------"

# bluetooth leser vorbereiten
sudo hciconfig hci0 down
sudo hciconfig hci0 up

#sudo timeout 1s hcitool lescan;
sudo timeout 0.1s hcitool lescan --duplicates 

#scan 5s die Beacons die in der nähe sind
sudo timeout 4.7s hcidump | egrep 'RSSI|bdaddr' > a.csv

#daten vorbereiten
awk '{print $2}' a.csv > $id.csv 
rm a.csv
#cat $id.csv
#rm $id.csv

dat=$(date '+%Y-%m-%d %H:%M:%S')

echo "------------------------------------ scan ende : $dat---------------------------------------------"
echo $id

#cat $id.csv > b.csv
#bash scan2_neu.sh $id

#die variable n enthält wie viel zeile in der file $d gibt
n=$(wc -l $id.csv)
echo $n

#die variable dd enthält der anzahl der zeilen von $d
c=$(echo $n | cut -d" " -f1)
echo $c

for ((i=1; i<=c; i=i+2));{ 

#die variable mac enthält die gescante mac_adr
mac=$(sed -n ${i}p $id.csv)
echo $mac
#die variable j enthält der indice der rssi der gescante mac_adr
j=$(( $i + 1 ))
echo $j
#die variable rssi enthält der value, die rssi_sert der gescante mac_adr
rssi=$(sed -n ${j}p $id.csv)
echo $rssi
#wenn die gescante mac_adr bekannt ist d.h wenn mac in mac.csv ist da wird die mac und rssi in adam.csv ==> $id.csv gespeichert
if  grep -R "$mac" "mac.csv"
then
    final=$mac" "$rssi
    echo $final
    echo $final >> ada.csv
fi
}

rm $id.csv
cat ada.csv