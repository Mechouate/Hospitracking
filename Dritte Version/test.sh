# Pi vorbereitung
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install netatalk
sudo update-rc.d avahi-daemon defaults
sudo nano /etc/avahi/services/afpd.service
            <?xml version=”1.0″ standalone=’no’?><!–*-nxml-*–>
            <!DOCTYPE service-group SYSTEM “avahi-service.dtd”>
            <service-group>
            <name replace-wildcards=”yes”>%h</name>
            <service>
            <type>_afpovertcp._tcp</type>
            <port>548</port>
            </service>
            </service-group>
sudo /etc/init.d/avahi-daemon restart
sudo apt-get install bluez bluez-hcidump
sudo apt-get install mysql-server --fix-missing
sudo apt-get install mysql-client
# sudo mysql --user=root --password=naima
# CREATE DATABASE raum;
# use raum;

            DROP TABLE IF EXISTS `objekt_information`;
            CREATE TABLE `objekt_information` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(225) DEFAULT NULL,
              `RSSI_Max1` varchar(40) DEFAULT NULL,
              `RSSI_Max2` varchar(40) DEFAULT NULL,
              `RSSI_Max3` varchar(40) DEFAULT NULL,
              `Mittelwert` FLOAT NOT NULL,
              `Maximum` TINYINT NOT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
            DROP TABLE IF EXISTS `objekt_max`;
            CREATE TABLE `objekt_max` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(225) DEFAULT NULL,
              `Maximum` TINYINT NOT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
sudo apt install bc
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
            ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
            update_config=1
            country=DE
            network={
                    ssid="FritzBoxHC1"
                    psk="1234567890A"
                    key_mgmt=WPA-PSK
                    id_str="work"}
            network={
                    ssid="VIRUS 1"
                    psk="11naima33"
                    key_mgmt=WPA-PSK
                    id_str="Home"}
            network={
                    ssid="iPhone von Adam"
                    psk="11naima33"
                    key_mgmt=WPA-PSK
                    id_str="Handy"}
scan1.sh & scan2.sh reinkopieren dann scan1.sh laufen lassen
sudo bash scan1.sh
sudo shutdown now

----------------------------------------------------------------
sudo nano /var/www/html/hospitracking.php
for run in {1..10}; do bash scan1.sh; done

----------------------------------------------------------------

sudo nano /var/www/html/hospitracking.php

<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Hospitracking</title>
        <meta http-equiv="refresh" content="10; URL=http://192.168.0.111/hospitracking.php">
        <link href="css/style.css" rel="stylesheet">
</head>
<body>
<section>
                        <h2> Hospitracking - Adam Mechouate - </h2>
                        <figure>
                                <img src="hospilogo.jpg" a>
                        </figure>
</section>
<?php
$pdo = new PDO('mysql:host=localhost;dbname=raum', 'root', '11naima22');
$sql = "SELECT * FROM objekt_information";
?>
<di>
<h2>Beacon scan : RTLS : REAL-TIME LOCATION SYSTEM </h2>
<table>
    <tr>
        <th>Objekt id</th>
        <th>Objekt Mac_Adr</th>
        <th>Create Date</th>
        <th>RSSI Max1</th>
        <th>RSSI Max2</th>
        <th>RSSI Max3</th>
        <th>Mittelwert</th>
        <th>Maximum</th>
        <th>Max Date</th>
        <th>Objekt Ort</th>
    </tr>
<?php
foreach ($pdo->query($sql) as $row) {
echo "<tr>";
echo "<td>".$row['objekt_id']."</td> <td>".$row['objekt_mac_adr']."</td> <td>".$row['create_date']."</td> <td>".$row['RSSI_Max1']."</td><td>".$row['RSSI_Max2']."</td><td>".$row['RSSI_Max3']."</td><td>".$$
echo "</tr>";
}
?>
</table>
</div>
</body>
</html>

-----------------------------------------------------------------

sudo nano /var/www/html/max.php

<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Hospitracking Max</title>
        <meta http-equiv="refresh" content="10; URL=http://192.168.0.111/max.php">
        <link href="css/style.css" rel="stylesheet">
</head>
<body>
<section>
                        <h2> Hospitracking Max - Adam Mechouate - </h2>
                        <figure>
                                <img src="hospilogo.jpg" a>
                        </figure>
</section>
<?php
$pdo = new PDO('mysql:host=localhost;dbname=raum', 'root', '11naima22');
$sql = "SELECT * FROM objekt_max";
?>
<di>
<h2>Beacon scan (RTLS) Max </h2>
<table>
    <tr>
        <th>Objekt id</th>
        <th>Objekt Mac_Adr</th>
        <th>Maximum</th>
        <th>Max Date</th>
        <th>Objekt Ort</th>
    </tr>
<?php
foreach ($pdo->query($sql) as $row) {
echo "<tr>";
echo "<td>".$row['objekt_id']."</td> <td>".$row['objekt_mac_adr']."</td> <td>".$row['Maximum']."</td> <td>".$row['Max_date']."</td <td>".$row['objekt_ort']."</td>";
echo "</tr>";
}
?>
</table>
</div>
</body>
</html>


-------------------------------------------------------------------

les bases de donnees du serveur

sudo mysql --user=root --password=11naima22 raum 

            DROP TABLE IF EXISTS `objekt_filter`;
            CREATE TABLE `objekt_filter` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(225)  NULL,
              `Mittelwert` FLOAT NOT NULL,
              `Maximum` TINYINT NOT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
            DROP TABLE IF EXISTS `objekt_max`;
            CREATE TABLE `objekt_max` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(225) DEFAULT NULL,
              `Maximum` TINYINT NOT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
            
            DROP TABLE IF EXISTS `objekt_entscheidung`;
            CREATE TABLE `objekt_entscheidung` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(40) DEFAULT NULL,
              `objekt_name` varchar(40) DEFAULT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              `create_date` timestamp,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
            DROP TABLE IF EXISTS `objekt_Name`;
            CREATE TABLE `objekt_Name` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(40) DEFAULT NULL,
              `objekt_name` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
-----------------------------------------------------------------------------

select adam.objekt_ort,adam.create_date from (select * from objekt_entscheidung where objekt_name='Tim')adam where create_date=(select Max(adam.create_date) from(select * from objekt_entscheidung where objekt_name='Tim')adam);

if (( $1 % 2 == 0 ))
then
echo "ungleich"
fi

-------------------------------------------------------------------------------

new page Hospitracking

<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Hospitracking</title>
        <meta http-equiv="refresh" content="10; URL=http://192.168.0.112/hospitracking.php">
        <link href="css/style.css" rel="stylesheet">
</head>
<body>
<section>
                        <h2> Hospitracking - Adam Mechouate - </h2>
                        <figure>
                                <img src="hospilogo.jpg" a>
                        </figure>
</section>
<?php
$pdo = new PDO('mysql:host=localhost;dbname=raum', 'root', '11naima22');
$sql = "SELECT * FROM objekt_entscheidung";
?>
<di>
<h2>Beacon scan : RTLS : REAL-TIME LOCATION SYSTEM </h2>
<table>
    <tr>
        <th>Objekt id</th>
        <th>Objekt Mac_Adr</th>
        <th>Objekt Name</th>
        <th>Objekt Ort</th>
        <th>Create Date</th>
    </tr>
<?php
foreach ($pdo->query($sql) as $row) {
echo "<tr>";
echo "<td>".$row['objekt_id']."</td> <td>".$row['objekt_mac_adr']."</td> <td>".$row['objekt_name']."</td> <td>".$row['objekt_ort']."</td> <td>".$row['create_date']."</td> ";
echo "</tr>";
}
?>
</table>
</div>
</body>
</html>

---------------------------------------------------
user Page : Nina

sudo nano /var/www/html/Nina.php


<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Hospitracking</title>
        <meta http-equiv="refresh" content="10; URL=http://192.168.0.112/Nina.php">
        <link href="css/style.css" rel="stylesheet">
</head>
<body>
<section>
                        <h2> Hospitracking - Adam Mechouate - </h2>
                        <figure>
                                <img src="hospilogo.jpg" a>
                        </figure>
</section>
<?php
$pdo = new PDO('mysql:host=localhost;dbname=raum', 'root', '11naima22');
$sql = "SELECT objekt_name,objekt_ort,create_date FROM objekt_entscheidung where objekt_name='Nina'";
?>
<di>
<h2>Beacon scan : RTLS : Nina </h2>
<table>
    <tr>
        <th>Objekt Name</th>
        <th>Objekt Ort</th>
        <th>Create Date</th>
    </tr>
<?php
foreach ($pdo->query($sql) as $row) {
echo "<tr>";
echo "<td>".$row['objekt_name']."</td> <td>".$row['objekt_ort']."</td> <td>".$row['create_date']."</td> ";
echo "</tr>";
}
?>
</table>
</div>
</body>
</html>


----------------------------------------------------

sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_entscheidung (objekt_mac_adr,objekt_name) VALUES ("","");"

sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_Name (objekt_mac_adr,objekt_name) VALUES ('AC:23:3F:24:98:CB','Thomas');"
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_Name (objekt_mac_adr,objekt_name) VALUES ('AC:23:3F:24:99:46','Peter');"
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_Name (objekt_mac_adr,objekt_name) VALUES ('AC:23:3F:24:99:57','Emily');"
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_Name (objekt_mac_adr,objekt_name) VALUES ('AC:23:3F:24:B2:EC','Elke');"
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_Name (objekt_mac_adr,objekt_name) VALUES ('AC:23:3F:24:B3:18','Dirk');"
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_Name (objekt_mac_adr,objekt_name) VALUES ('AC:23:3F:24:B3:1F','Joerg');"
sudo mysql --user=$DB_USER --password=$DB_PASSWD $DB_NAME -e"INSERT INTO objekt_Name (objekt_mac_adr,objekt_name) VALUES ('AC:23:3F:24:CC:E9','Lina);"


----------------------------------------------------

for i in {1..8}; do ssh raum${i} 'sudo shutdown now'; done
sudo shutdown now