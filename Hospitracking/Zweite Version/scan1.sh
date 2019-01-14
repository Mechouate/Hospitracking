#!/bin/bash -x

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"

#scan vorbereiten hcitool und hcidump Bibliothek
sudo hciconfig hci0 down
sudo hciconfig hci0 up
#sudo timeout 1s hcitool lescan;
sudo timeout 0.2s hcitool lescan --duplicates 
#scan die Beacons die in der nähe sind
sudo timeout 2s hcidump | egrep 'bdaddr' > a.csv
awk '{print $2}' a.csv > b.csv 
rm a.csv
sudo sort b.csv| uniq | egrep 'AC:23:3F:24' > c.csv
rm b.csv
n=$(wc -l c.csv)
d=$(echo $n | cut -d" " -f1)
#echo "$n"
#cat c.csv
names=''
for ((i=1; i<=d; i++)); do names="$(sed -n ${i}p c.csv) $names" ; done
for name in $names; do sh scan2.sh 10s $name &  done; wait
rm c.csv
#Daten Bank zeigen
sudo mysql --user=root --password=naima raum -e"select * from objekt_information;"

dat=$(date '+%Y-%m-%d %H:%M:%S')
echo "------------------------------------$dat---------------------------------------------"