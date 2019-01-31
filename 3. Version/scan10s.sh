#!/bin/bash -x
# scan vorbereiten hcitool und hcidump Bibliothek
#sudo timeout 2s hcitool lescan;
sudo hciconfig hci0 down
sudo hciconfig hci0 up
sudo timeout 1s hcitool lescan --duplicates 
# scan die Beacons die in der nähe sind
sudo timeout 2s hcidump | egrep 'bdaddr' > f.csv
awk '{print $2}' f.csv > ff.csv
rm f.csv
sudo sort ff.csv| uniq | egrep 'AC:23:3F' > fff.csv
rm ff.csv
i=$(wc -l fff.csv)
#scan für 10 Sekunden nach die Mac Adresse 'XY'
time=$1
mac=$2
host=$(hostname)
sudo timeout $time hcidump | egrep 'RSSI|'$mac'' > f1.csv;
# RSSI Filter 1 f1==>f2 
awk '$0~/'$mac'/ {getline ;print $0}' f1.csv > f2.csv
# remove f1
rm f1.csv
# RSSI Filter 2 f2==>f3
awk '{print $2}' f2.csv > f3.csv
#remove f2
rm f2.csv
# le nombre d'objet scanner
wc -l f3.csv
#sortieren nach größe f3==>f31
#sort f3.csv > f31.csv
#remove f3
#rm f3.csv
# erst sortieren |dann| wie Häufig ist jeden Wert |dann| die Häufigste Wert steht Oben 1.Max , 2.Max ... f3==>f4
sudo sort f3.csv| uniq -c | sort -rn > f4.csv
#remove f4
rm f3.csv
# f4==>f5
#sort -rn  f4.csv > f5.csv
#remove f4
#rm f4.csv
# Print Result ==>f4
cat f4.csv
echo "Welcome $host"
echo "Der 1. Maximun"
v1=$(sed -n 1p f4.csv)
echo "$v1"
echo "Der 2. Maximun"
v2=$(sed -n 2p f4.csv)
echo "$v2"
echo "Der 3. Maximun"
v3=$(sed -n 3p f4.csv)
echo "$v3"
#remove f4
rm f4.csv

DB_USER='root';
DB_PASSWD='naima';
DB_NAME='Raum1';
TABLE='objekt_information';

#Ergebniße im Daten Bank speichern
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO $TABLE (objekt_mac_adr, create_date, RSSI_Max1, RSSI_Max2, RSSI_Max3, objekt_ort ) VALUES ("$mac",NOW(),"$v1", "$v2","$v3", "$host");
EOF