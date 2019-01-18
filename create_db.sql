# daten Tabelle
/*
  This file generates a database schema which is used to document the
  information from bluetooth-based trasmitters and receivers.

  @Author: Adam Mechouate
*/

# in diese Tabelle werden alle informationen, die von alle Leser gekommen sind, gesammelt, vergliechen und gefiltert.

            DROP TABLE IF EXISTS `objekt_filter`;
            CREATE TABLE `objekt_filter` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(225)  NULL,
              `Mittelwert` FLOAT NOT NULL,
              `Maximum` TINYINT NOT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
# in diese Tabelle wird die endgültige Entscheidung gespeichert, d.h wo befinden sich die BLE-Beacons.
            
            DROP TABLE IF EXISTS `objekt_entscheidung`;
            CREATE TABLE `objekt_entscheidung` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(40) DEFAULT NULL,
              `objekt_name` varchar(40) DEFAULT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              `create_date` timestamp,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                     
# in diese Tabelle können wir für jeden Beacon eine "Gerät-Name" zuweisen, d.h auf welcher Gegenstand ist der Beacon gehängt bzw. geklebt.

            DROP TABLE IF EXISTS `beacon_name`;
            CREATE TABLE `objekt_Name` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(40) DEFAULT NULL,
              `objekt_name` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
# in diese Tabelle können wir für jeden Pi eine "Raum-Name" zuweisen, d.h in welchen Raum/fläsche ist der Pi eingebaut.
            
            DROP TABLE IF EXISTS `raum_name`;
            CREATE TABLE `raum_Name` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `ip_adr` varchar(40) DEFAULT NULL,
              `raum_name` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
# diese Tabelle befindet sich in der Lokalen Daten-Bank der Pi, hier wird für jeden gescanten Beacon eine signifikante Wert gespeichert
            
            DROP TABLE IF EXISTS `objekt_max`;
            CREATE TABLE `objekt_max` (
              `objekt_id` int(225) NOT NULL AUTO_INCREMENT,
              `objekt_mac_adr` varchar(225) DEFAULT NULL,
              `Maximum` TINYINT NOT NULL,
              `objekt_ort` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`objekt_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;