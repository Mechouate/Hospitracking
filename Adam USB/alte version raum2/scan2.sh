#!/bin/bash -x
#scan für 30 Sekunden nach die Mac Adresse 'XY'
time=$1
mac=$2
host=$(hostname)
hosti=$(hostname -I|awk '{print $1}')
sudo timeout $time hcidump | egrep 'RSSI|'$mac'' > $mac-1.csv;
# RSSI Filter 1 f1==>f2 
awk '$0~/'$mac'/ {getline ;print $0}' $mac-1.csv > $mac-2.csv
# remove f1
rm $mac-1.csv
# RSSI Filter 2 f2==>f3
awk '{print $2}' $mac-2.csv > $mac-3.csv
#remove f2
rm $mac-2.csv
# le nombre de Signale scanner
wc -l $mac-3.csv
# erst sortieren |dann| wie Häufig ist jeden Wert |dann| die Häufigste Wert steht Oben 1.Max , 2.Max ... f3==>f4
sudo sort $mac-3.csv| uniq -c | sort -rn > $mac.4.csv
#remove f3
rm $mac-3.csv
# Print Result ==>f4
#cat $mac-4.csv
echo "Welcome $host $hosti"
#echo "Der 1. Maximun"
v1=$(sed -n 1p $mac.4.csv)
v11=$(sed -n 1p $mac.4.csv|awk '{print $1}')
v12=$(sed -n 1p $mac.4.csv|awk '{print $2}')
#echo "$v1"
#echo "Der 2. Maximun"
v2=$(sed -n 2p $mac.4.csv)
v21=$(sed -n 2p $mac.4.csv|awk '{print $1}')
v22=$(sed -n 2p $mac.4.csv|awk '{print $2}')
#echo "$v2"
#echo "Der 3. Maximun"
v3=$(sed -n 3p $mac.4.csv)
v31=$(sed -n 3p $mac.4.csv|awk '{print $1}')
v32=$(sed -n 3p $mac.4.csv|awk '{print $2}')
#echo "$v3"
#remove f4
sort -k2 -n $mac.4.csv > $mac.5.csv 
rm $mac.4.csv

# Mittelwert berechnen
m1=$(($v11 * $v12))
#echo $m1
m2=$(($v21 * $v22))
#echo $m2
m3=$(($v31 * $v32))
#echo $m3
m4=$(($v11 + $v21 + $v31))
#echo $m4
m=$(($m1 + $m2 + $m3))
#echo $m
mw=$(echo "scale=2; $m / $m4;" | bc)
#echo $mw

# Maximum der scan raus finden
s=$(wc -l $mac.5.csv|awk '{print $1}')
max=$(sed -n ${s}p $mac.5.csv|awk '{print $2}')
rm $mac.5.csv

DB_USER='root';
DB_PASSWD='11naima22';
DB_NAME='raum';
TABLE='objekt_information';

#Ergebniße im Daten Bank speichern
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO $TABLE (objekt_mac_adr, create_date, RSSI_Max1, RSSI_Max2, RSSI_Max3, Mittelwert, Maximum, objekt_ort ) VALUES ("$mac",NOW(),"$v1", "$v2","$v3","$mw" ,"$max" , "$host $hosti");
EOF
