#!/bin/bash -x

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Scan Begin : $dat---------------------------------------------"

for ((i=1; i<=8; i++)); do ssh raum${i} 'bash scan1_Max.sh' & done; wait

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Scan Ende : $dat---------------------------------------------"

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Daten Sammlung Begin : $dat---------------------------------------------"

for ((i=1; i<=8; i++)); do ssh pi@raum${i} 'cat *.1.csv' & done > adam.csv ; wait

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Daten Sammlung Ende :$dat---------------------------------------------"

n=$(wc -l adam.csv)
d=$(echo $n | cut -d" " -f1)

for ((i=1; i<=d; i++));{
mac=$(sed -n ${i}p adam.csv | awk '{print $1}')
max=$(sed -n ${i}p adam.csv | awk '{print $2}')
host=$(sed -n ${i}p adam.csv | awk '{print $3}')

DB_USER='root';
DB_PASSWD='11naima22';
DB_NAME='raum';
TABLE='objekt_max';

sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO $TABLE (objekt_mac_adr,Maximum, objekt_ort ) VALUES ("$mac","$max","$host");
EOF
}

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Daten sind im Datenbank gespeichert : $dat---------------------------------------------"

sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"select * from objekt_max;"
sudo mysql --user=root --password=11naima22 raum -e"select objekt_mac_adr from objekt_max group by objekt_mac_adr;" > a.csv

n=$(wc -l a.csv)
d=$(echo $n | cut -d" " -f1)
date=$(date '+%Y-%m-%d %H:%M:%S')

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Entscheidungsbeginn : $dat---------------------------------------------"

for ((i=2; i<=d; i++));{

mac=$(sed -n ${i}p a.csv)

#ort=$(sudo mysql --user=root --password=11naima22 raum -e"select objekt_ort from objekt_filter where objekt_mac_adr='$mac' and Mittelwert=(select Max(Mittelwert) from objekt_filter where objekt_mac_adr='$mac');" | sed -n 2p)

ort=$(sudo mysql --user=root --password=11naima22 raum -e"select objekt_ort from objekt_max where objekt_mac_adr='$mac' and Maximum=(select Max(Maximum) from objekt_max where objekt_mac_adr='$mac');" | sed -n 2p)

name=$(sudo mysql --user=root --password=11naima22 raum -e"select objekt_name from objekt_Name where objekt_mac_adr='$mac';"| sed -n 2p)

#letztes_ort=$(sudo mysql --user=root --password=11naima22 raum -e"select adam.objekt_ort,adam.create_date from (select * from objekt_entscheidung where objekt_name='$name')adam where create_date=(select Max(adam.create_date) from(select * from objekt_entscheidung where objekt_name='$name')adam);" | sed -n 2p |awk '{print $1}')

#if [[ "$ort" != "$letztes_ort" ]]
#then
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO objekt_entscheidung (objekt_mac_adr,objekt_name ,objekt_ort,create_date ) VALUES ("$mac","$name","$ort","$date");
EOF
#fi
}

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------ Entscheidungsende : $dat---------------------------------------------"

rm a.csv
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"TRUNCATE TABLE objekt_max;"

sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"select * from objekt_entscheidung;"

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "Ende : $dat"