# Create Datenbank im Server
/*
  This file generates a database schema which is used to document the
  information from bluetooth-based trasmitters and receivers.

  @Author: Adam Mechouate
*/
# in diese Tabelle werden alle informationen, die von alle Leser gekommen sind, gesammelt, vergliechen und gefiltert.

            DROP TABLE IF EXISTS `filter`;
            CREATE TABLE `filter` (
              `id` int(225) NOT NULL AUTO_INCREMENT,
              `beacon_mac` varchar(225)  NULL,
              `average` FLOAT NOT NULL,
              `max` TINYINT NOT NULL,
              `status` varchar(40) DEFAULT NULL,
              `pi_mac` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
# in diese Tabelle wird die endgueltige Entscheidung gespeichert, d.h wo befinden sich die BLE-Beacons.
            
            DROP TABLE IF EXISTS `decision`;
            CREATE TABLE `decision` (
              `id` int(225) NOT NULL AUTO_INCREMENT,
              `beacon_mac` varchar(40) DEFAULT NULL,
              `status` varchar(40) DEFAULT NULL,
              `pi_mac` varchar(40) DEFAULT NULL,
              `date` timestamp,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
# in diese Tabelle werden die Mac_adr alle beacons, die gescant werden sollen, aufgelistet.
            
            DROP TABLE IF EXISTS `beacon`;
            CREATE TABLE `beacon` (
              `id` int(225) NOT NULL AUTO_INCREMENT,
              `beacon_mac` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
# in diese Tabelle werden die Mac_adr und IP-adr alle pi s aufgelistet.
            
            DROP TABLE IF EXISTS `pi`;
            CREATE TABLE `pi` (
              `id` int(225) NOT NULL AUTO_INCREMENT,
              `pi_ip` varchar(40) DEFAULT NULL,                
              `pi_mac` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;