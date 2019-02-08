# Create Datenbank in Pi s
/*
  This file generates a database schema which is used to document the
  information from bluetooth-based trasmitters and receivers.

  @Author: Adam Mechouate
*/
            
# nach X sekunden wird der scan Ergebnis hier gespeichert
            DROP TABLE IF EXISTS `scan`;
            CREATE TABLE `scan` (
              `id` int(225) NOT NULL AUTO_INCREMENT,
              `beacon_mac` varchar(225)  NULL,
              `pi_mac` varchar(40) DEFAULT NULL,
              `status` varchar(40) DEFAULT NULL,
              `scan_id` int NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            
# SQL CREATE TABLE in sqlite3

#sqlite> BEGIN;
#sqlite> CREATE TABLE dhtreadings(id INTEGER PRIMARY KEY AUTOINCREMENT, temperature NUMERIC, humidity NUMERIC, currentdate DATE, currentime TIME, device TEXT);
#sqlite> COMMIT;

sqlite> BEGIN;
sqlite> CREATE TABLE scan (id INTEGER PRIMARY KEY AUTOINCREMENT, beacon_mac TEXT,pi_mac TEXT,status TEXT, scan_id NUMERIC);
sqlite> COMMIT;