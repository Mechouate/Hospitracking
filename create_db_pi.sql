# Create Datenbank in Pi's
/*
  This file generates a database schema which is used to document the
  information from bluetooth-based trasmitters and receivers.

  @Author: Adam Mechouate
*/
# in diese Tabelle werden alle wichtige informationen und signifikante werten der Scan gespeichert.

            DROP TABLE IF EXISTS `information`;
            CREATE TABLE `information` (
              `id` int(225) NOT NULL AUTO_INCREMENT,
              `beacon_mac` varchar(225)  NULL,
              `most_often_1` varchar(40) DEFAULT NULL,
              `most_often_2` varchar(40) DEFAULT NULL,
              `most_often_3` varchar(40) DEFAULT NULL,
              `average_often` FLOAT NOT NULL,
              `max` TINYINT NOT NULL,
              `status` varchar(40) DEFAULT NULL,
              `pi_mac` varchar(40) DEFAULT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;