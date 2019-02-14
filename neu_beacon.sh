#!/bin/bash -x

# bluetooth leser vorbereiten
sudo hciconfig hci0 down
sudo hciconfig hci0 up

#sudo timeout 1s hcitool lescan;
sudo timeout 0.1s hcitool lescan --duplicates 

#scan 5s die Beacons die in der nähe sind
sudo timeout 1.4s hcidump | egrep 'RSSI|bdaddr' > a.csv

#daten vorbereiten
awk '{print $2}' a.csv > b.csv 
rm a.csv

n=$(wc -l b.csv)
c=$(echo $n | cut -d" " -f1)

if [ $c -eq 0 ] 
then 
    echo " es wurde kein bekantes Beacon erkannt ! "
else
    for ((i=1; i<=c; i=i+2))
    do
        #die variable mac enthält die gescante mac_adr
        mac=$(sed -n ${i}p b.csv)

        #die variable j enthält der indice der rssi der gescante mac_adr
        j=$(( $i + 1 ))

        #die variable rssi enthält der value, die rssi_wert der gescante mac_adr
        rssi=$(sed -n ${j}p b.csv)
        
        if [ $rssi -ge -50 ]; then final=$rssi" "$mac ; echo $final >> c.csv ; fi
    done
fi

rm b.csv
sort c.csv > d.csv
rm c.csv
rssi=$(sed -n 1p d.csv|awk '{print $1}')
mac_max=$(sed -n 1p d.csv|awk '{print $2}')

if [ $rssi -ge -36 ]
then
    var=$(grep -R "$mac_max" "mac.csv")
    if [ "$var" ]
    then
        echo "dieser Beacon ist schon bekannt, er gehoert schon zu deine Liste !"
    else
        echo " die Mac Adresse der neuen Beacon ist : $mac_max "
        echo $mac_max >> mac.csv
    fi
else
    echo "Es wurde kein Beacon erkannt, machen sie bitte der Beacon an dann scannen Sie nochmal !  "
fi
rm d.csv
echo "alle bekannten Mac Adressen sind : "
cat mac.csv