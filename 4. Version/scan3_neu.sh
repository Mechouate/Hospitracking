#!/bin/bash -x

#raw=$1
mac=$1
echo $mac
#sudo mysql --user=root --password=11naima22 raum -e"select rssi from scan where beacon_mac="$mac" and raw="$raw";" > $mac-$raw-0.csv
sudo mysql --user=root --password=11naima22 raum -e"select rssi from scan where beacon_mac='$mac';" > $mac-$raw-0.csv
sudo sort $mac-$raw-0.csv| uniq -c | sort -rn > $mac-$raw-1.csv

#remove $mac-$raw-0.csv
#rm $mac-$raw-0.csv

#sort -k2 -n $mac-$raw-1.csv > $mac-$raw-2.csv 
#remove $mac-$raw-1.csv
#rm $mac-$raw-1.csv
cat $mac-$raw-0.csv

#rm $mac-$raw-2.csv
# mussen die ersten zwei und die letzten zwei weg geschmissen werden

# dann kucken wir ob 50% der gebliebenen werten im Nah bereich sind wenn Ja Status="Nah Bereich" wenn nicht Status="nicht im Nah Bereich"

# Mittelwert der gebliebenen Werten als Signifikant-Wert rechnen 

# Maximum rechnen kann auch sinnvoll sein !

# if (-60<i<-20) das heit das der gescannten Beacon im Status = "Nah bereich" ist und so wird erst die information zum server weiter geleitet 
#if(i>>-60 && i<<-20)

pi_mac=$(ifconfig | grep 'b8:27:eb'| awk '{print $2}'| sed -n 1p)
echo "voila mon adresse mac : b8:27:eb:2c:e8:9d = ))" 
echo $pi_mac

#Ergebniße im Daten Bank speichern
#sudo mysql --user=root --password=naima raum << EOF
#INSERT INTO information (beacon_mac,most_often_1,most_often_2,most_often_3,average_often,Maximum,status,pi_mac) VALUES ("$mac","$max1","$host");
#EOF

# vergleichen mit dem alten Status wenn geändert da die info zum Server schicken ! (abhelen als neue bereich hinfügen)