#!/bin/bash -x
d=$1

# die variable d enthält file_name der gescannten daten die bearbeitet werden muessen 
echo $d

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Filter begin : $dat -------------------------------------------------------------------"

#die variable n enthält wie viel zeile in der file $d gibt
n=$(wc -l $d.csv)
echo $n

#die variable dd enthält der anzahl der zeilen von $d
c=$(echo $n | cut -d" " -f1)
echo $c

for ((i=1; i<=c; i=i+2));{ 

#die variable mac enthält die gescante mac_adr
mac=$(sed -n ${i}p $d.csv)

#die variable j enthält der indice der rssi der gescante mac_adr
j=$(( $i + 1 ))

#die variable rssi enthält der value, die rssi_sert der gescante mac_adr
rssi=$(sed -n ${j}p $d.csv)

#wenn die gescante mac_adr bekannt ist d.h wenn mac in mac.csv ist da wird die mac und rssi in adam.csv ==> $id.csv gespeichert
if  grep -R "$mac" "mac.csv"
then
final=$mac" "$rssi
echo $final
echo $final >> $d.1.csv
fi
}

rm $d.csv
cat $d.1.csv

#cat adam.csv
#n=$(wc -l $id.csv)
#echo $n

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Filter ende & in SQL speichern begin : $dat ---------------------------------------------"

# wieviel beacon sind gescant bzw. in der $d.csv ==> $id.csv Datei gespeichert
#n=$(wc -l $id.csv)
#ddd=$(echo $n | cut -d" " -f1)

# alle gescanten Beacon in Datenbank speichern
#for ((i=1; i<=ddd; i=i+1));{ 
#info=$(sed -n ${i}p $id.csv)
#macc=$(echo $info | cut -d" " -f1)
#rssii=$(echo $info | cut -d" " -f2)
#raw=$i

#sqlite3 raum.db "insert into scan (beacon_mac,rssi,raw) values ('$mac','$rssi','$raw');"

#sqlite3 raum.db <<END_SQL
#INSERT INTO scan(beacon_mac,rssi,raw) values("$mac", "$rssi", "$raw");
#END_SQL

#sudo mysql --user=root --password=11naima22 raum << EOF
#INSERT INTO scan(beacon_mac,rssi,raw) VALUES ("$macc","$rssii","$raw");
#EOF

#}

# löche alle fremd-Beacon
#sudo mysql --user=root --password=11naima22 raum -e"delete from scan where beacon_mac not in (select beacon_mac from beacon);"
#sudo mysql --user=root --password=11naima22 raum -e"select * from scan;"
#sudo mysql --user=root --password=11naima22 raum -e"TRUNCATE Table scan;"

#dat=$(date '+%Y-%m-%d %H:%M:%S')
#echo "------------------------------------ gescante daten in sql gespeichert - Ende : $dat ---------------------------------------------"

# nachdem wir alle daten von $dat1.csv in sql gespeichert haben, da können wir $dat1.csv löschen
#rm $id.csv
#idd=`date +%s`
#echo $idd

# filter alle "Distinct" gescanten bekanten Beacons mac_adr und in names speichern
#sudo mysql --user=root --password=11naima22 raum -e"select DISTINCT beacon_mac from scan;" > $idd.csv

#n=$(wc -l $idd.csv)
#dddd=$(echo $n | cut -d" " -f1)
#names=''
#for ((i=2; i<=dddd; i++)); do names="$(sed -n ${i}p $idd.csv) $names" ; done

#nachdem wir die einzelnen gescanten mac_adr von $idd.csv in names gespeichrt haben, koennen wir $idd.csv loeschen
#rm $idd.csv

# Causing the function to be executed in a forked shell in the background. That's parallel.
# strating scan2 with raw and mac_adr von Beacon
#for name in $names; do bash scan3_neu.sh $name &  done