#!/bin/bash -x

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"

for ((i=1; i<=8; i++)); do ssh raum${i} 'bash scan1.sh' & done; wait
for ((i=1; i<=8; i++)); do ssh raum${i} 'sudo mysql --user=root --password=naima raum -e"select * from objekt_information;"' > raum${i}.csv & done; wait

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"

#for name in $names; do cat $name.csv ; done
#for name in $names; do ssh pi@${name} 'sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"delete from objekt_information;"'& done; wait
for ((i=1; i<=8; i++)); do ssh raum${i} 'sudo mysql --user=root --password=naima raum -e"TRUNCATE TABLE objekt_information;"'& done; wait

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"

#adr=$(sed -n 1p mac.csv)
#sed -n 1p $adr.csv > raum.0.csv
for ((i=1; i<=8; i++)); do sed '1d' raum${i}.csv > raum${i}.1.csv ; done
for ((i=1; i<=8; i++)); do rm raum${i}.csv ; done
cat raum*.csv >concat.csv
rm raum*.csv
cut -f1 --complement concat.csv > con.csv
rm concat.csv
sudo sort -rn con.csv > co.csv
rm con.csv
cat co.csv
n=$(wc -l co.csv)
d=$(echo $n | cut -d" " -f1)

for ((i=1; i<=d; i++));{
mac=$(sed -n ${i}p co.csv | awk '{print $1}')
mw=$(sed -n ${i}p co.csv | awk '{print $8}')
max=$(sed -n ${i}p co.csv | awk '{print $9}')
host=$(sed -n ${i}p co.csv | awk '{print $10}')

DB_USER='root';
DB_PASSWD='11naima22';
DB_NAME='raum';
TABLE='objekt_filter';

sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO $TABLE (objekt_mac_adr, Mittelwert,Maximum, objekt_ort ) VALUES ("$mac","$mw","$max","$host");
EOF
}

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"

rm co.csv
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"select * from objekt_filter;"

sudo mysql --user=root --password=11naima22 raum -e"select objekt_mac_adr from objekt_filter group by objekt_mac_adr;" > a.csv

n=$(wc -l a.csv)
d=$(echo $n | cut -d" " -f1)
date=$(date '+%Y-%m-%d %H:%M:%S')

for ((i=2; i<=d; i++));{

mac=$(sed -n ${i}p a.csv)

#ort=$(sudo mysql --user=root --password=11naima22 raum -e"select objekt_ort from objekt_filter where objekt_mac_adr='$mac' and Mittelwert=(select Max(Mittelwert) from objekt_filter where objekt_mac_adr='$mac');" | sed -n 2p)

#ort=$(sudo mysql --user=root --password=11naima22 raum -e"select objekt_ort from objekt_filter where objekt_mac_adr='$mac' and Maximum=(select Max(Maximum) from objekt_filter where objekt_mac_adr='$mac');" | sed -n 2p)

ort=$(sudo mysql --user=root --password=11naima22 raum -e"select objekt_ort from objekt_filter where objekt_mac_adr='$mac' and Mittelwert=(select Max(Mittelwert) from objekt_filter where objekt_mac_adr='$mac');" | sed -n 2p)

name=$(sudo mysql --user=root --password=11naima22 raum -e"select objekt_name from objekt_Name where objekt_mac_adr='$mac';"| sed -n 2p)

letztes_ort=$(sudo mysql --user=root --password=11naima22 raum -e"select adam.objekt_ort,adam.create_date from (select * from objekt_entscheidung where objekt_name='$name')adam where create_date=(select Max(adam.create_date) from(select * from objekt_entscheidung where objekt_name='$name')adam);" | sed -n 2p |awk '{print $1}')

if [[ "$ort" != "$letztes_ort" ]]
then
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME << EOF
INSERT INTO objekt_entscheidung (objekt_mac_adr,objekt_name ,objekt_ort,create_date ) VALUES ("$mac","$name","$ort","$date");
EOF
fi
}

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"

rm a.csv
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"TRUNCATE TABLE objekt_filter;"

sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"select * from objekt_entscheidung;"

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo $dat