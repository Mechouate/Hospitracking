# beacon_mac insert into beacon

insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:B3:1F");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:B3:18");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:B2:EC");
insert into beacon(beacon_mac) VALUES ("C8:2E:E5:77:F2:AB");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:CC:E9");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:CC:EF");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:CC:F1");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:C8:AD");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:A1:D4");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:AF:84");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:AF:81");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:AF:77");
insert into beacon(beacon_mac) VALUES ("EC:81:BC:0D:F1:DA");
insert into beacon(beacon_mac) VALUES ("EC:94:19:54:21:2F");
insert into beacon(beacon_mac) VALUES ("EC:A5:DE:FB:86:3E");
insert into beacon(beacon_mac) VALUES ("F5:21:9F:4D:65:99");

MariaDB [raum]> select * from beacon;
+----+-------------------+
| id | beacon_mac        |
+----+-------------------+
|  1 | AC:23:3F:24:B3:1F |
|  2 | AC:23:3F:24:B3:18 |
|  3 | AC:23:3F:24:B2:EC |
|  4 | C8:2E:E5:77:F2:AB |
|  5 | AC:23:3F:24:98:CB |
|  6 | AC:23:3F:24:99:46 |
|  7 | AC:23:3F:24:99:57 |
|  8 | AC:23:3F:24:CC:E9 |
|  9 | AC:23:3F:24:CC:EF |
| 10 | AC:23:3F:24:CC:F1 |
| 11 | AC:23:3F:24:C8:AD |
| 12 | AC:23:3F:24:A1:D4 |
| 13 | AC:23:3F:24:AF:84 |
| 14 | AC:23:3F:24:AF:81 |
| 15 | AC:23:3F:24:AF:77 |
| 16 | EC:81:BC:0D:F1:DA |
| 17 | EC:94:19:54:21:2F |
| 18 | EC:A5:DE:FB:86:3E |
| 19 | F5:21:9F:4D:65:99 |
+----+-------------------+
19 rows in set (0.00 sec)

--------------------------------------------------------------------------

# pi_ip und pi_mac insert into pi

insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.119","b8:27:eb:72:af:fd");
insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.120","b8:27:eb:fe:de:4f");
insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.116","b8:27:eb:6d:cc:10");
insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.122","b8:27:eb:ca:3f:f5");
insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.113","b8:27:eb:1c:61:13");
insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.118","b8:27:eb:7b:a9:f8");
insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.115","b8:27:eb:9a:b2:cc");
insert into pi(pi_ip,pi_mac) VALUES ("192.168.0.117","b8:27:eb:88:05:e1");

MariaDB [raum]> select * from pi;
+----+---------------+-------------------+
| id | pi_ip         | pi_mac            |
+----+---------------+-------------------+
|  1 | 192.168.0.119 | b8:27:eb:72:af:fd |
|  2 | 192.168.0.120 | b8:27:eb:fe:de:4f |
|  3 | 192.168.0.116 | b8:27:eb:6d:cc:10 |
|  4 | 192.168.0.122 | b8:27:eb:ca:3f:f5 |
|  5 | 192.168.0.113 | b8:27:eb:1c:61:13 |
|  6 | 192.168.0.118 | b8:27:eb:7b:a9:f8 |
|  7 | 192.168.0.115 | b8:27:eb:9a:b2:cc |
|  8 | 192.168.0.117 | b8:27:eb:88:05:e1 |
+----+---------------+-------------------+
8 rows in set (0.00 sec)

--------------------------------------------------------------------------

pi@Server:~ $ arp -na | grep -i b8:27:eb

? (192.168.0.119) auf b8:27:eb:72:af:fd [ether] auf eth0
? (192.168.0.120) auf b8:27:eb:fe:de:4f [ether] auf eth0
? (192.168.0.116) auf b8:27:eb:6d:cc:10 [ether] auf eth0
? (192.168.0.122) auf b8:27:eb:ca:3f:f5 [ether] auf eth0
? (192.168.0.113) auf b8:27:eb:1c:61:13 [ether] auf eth0
? (192.168.0.118) auf b8:27:eb:7b:a9:f8 [ether] auf eth0
? (192.168.0.115) auf b8:27:eb:9a:b2:cc [ether] auf eth0
? (192.168.0.117) auf b8:27:eb:88:05:e1 [ether] auf eth0

--------------------------------------------------------------------------

Vorhandene Beacon	Beschreibung

AC:23:3F:24:B3:1F	Neu ein € Münze
AC:23:3F:24:B3:18	Neu ein € Münze
AC:23:3F:24:B2:EC	Neu ein € Münze
C8:2E:E5:77:F2:AB 	Alt Beacon ein € Münze
AC:23:3F:24:98:CB	on/off drinnen
AC:23:3F:24:99:46	on/off drinnen
AC:23:3F:24:99:57	on/off drinnen
AC:23:3F:24:CC:E9 	on/off draußen
AC:23:3F:24:CC:EF	on/off draußen
AC:23:3F:24:CC:F1	on/off draußen
AC:23:3F:24:C8:AD 	Groß Schwarz Beacon
AC:23:3F:24:A1:D4	Groß Weiß Beacon 
AC:23:3F:24:AF:84	Die Ganz dünne Beacon E8 out
AC:23:3F:24:AF:81 	Die Ganz dünne Beacon E8 alt
AC:23:3F:24:AF:77 	Die Ganz dünne Beacon E8 neu
EC:81:BC:0D:F1:DA 	Estimote Blau
EC:94:19:54:21:2F 	Estimote Lila
EC:A5:DE:FB:86:3E 	Estimote Grün
F5:21:9F:4D:65:99 	BLE Watch