#!/bin/bash -x
#scan für 30 Sekunden nach die Mac Adresse 'XY'
time=$1
mac=$2

host=$(hostname)
sudo timeout $time hcidump | egrep 'RSSI|'$mac'' > $mac-1.csv;

#RSSI Filter 1 f1==>f2 
awk '$0~/'$mac'/ {getline ;print $0}' $mac-1.csv > $mac-2.csv

#remove f1
rm $mac-1.csv

#RSSI Filter 2 f2==>f3
awk '{print $2}' $mac-2.csv > $mac-3.csv

#remove f2
rm $mac-2.csv

#erst sortieren |dann| wie Häufig ist jeden Wert |dann| die Häufigste Wert steht Oben 1.Max , 2.Max ... f3==>f4
sudo sort $mac-3.csv| uniq -c | sort -rn > $mac.4.csv

#remove f3
rm $mac-3.csv
sort -k2 -n $mac.4.csv > $mac.5.csv 
#remove f4
rm $mac.4.csv

#Maximum der scan raus finden
s=$(wc -l $mac.5.csv|awk '{print $1}')
max1=$(sed -n ${s}p $mac.5.csv|awk '{print $2}')
rm $mac.5.csv

#Ergebniße im Daten Bank speichern
DB_USER='root';
DB_PASSWD='naima';
DB_NAME='raum';
TABLE='objekt_max';
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO $TABLE (objekt_mac_adr,Maximum,objekt_ort) VALUES ("$mac","$max1","$host");
EOF