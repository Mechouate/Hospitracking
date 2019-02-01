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
sudo timeout 1.2s hcidump | egrep 'RSSI|bdaddr' > a.csv

#daten vorbereiten
awk '{print $2}' a.csv > $id.csv 
rm a.csv

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ scan ende : $dat---------------------------------------------"

nohup bash adam2.sh $id