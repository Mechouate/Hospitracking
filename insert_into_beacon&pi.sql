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
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:A1:D2");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:A2:0E");
insert into beacon(beacon_mac) VALUES ("AC:23:3F:24:A2:0E");
insert into beacon(beacon_mac) VALUES ("C0:AD:72:70:5B:AB");
insert into beacon(beacon_mac) VALUES ("CC:16:08:85:7F:99");
insert into beacon(beacon_mac) VALUES ("C7:E9:5F:BE:F5:82");
insert into beacon(beacon_mac) VALUES ("C8:2E:E5:77:F2:AB");
insert into beacon(beacon_mac) VALUES ("E6:6A:0E:B6:A8:21");
insert into beacon(beacon_mac) VALUES ("FC:BB:10:74:CF:70");

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
| 16 | AC:23:3F:24:A1:D2 |
| 17 | AC:23:3F:24:A2:0E |
| 18 | C0:AD:72:70:5B:AB |
| 19 | CC:16:08:85:7F:99 |
| 20 | C7:E9:5F:BE:F5:82 |
| 21 | C8:2E:E5:77:F2:AB |
| 22 | E6:6A:0E:B6:A8:21 |
+----+-------------------+
22 rows in set (0.00 sec)

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

pi@Server: arp -na | grep -i b8:27:eb

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

AC:23:3F:24:B3:1F	Neu Muenze
AC:23:3F:24:B3:18	Neu Muenze
AC:23:3F:24:B2:EC	Neu Muenze
C0:AD:72:70:5B:AB   Alte Beacon Muenze A1
CC:16:08:85:7F:99   Alte Beacon Muenze B2
C7:E9:5F:BE:F5:82   Alte Beacon Muenze C3
C8:2E:E5:77:F2:AB   Alte Beacon Muenze
E6:6A:0E:B6:A8:21   Alte Beacon Muenze 
FC:BB:10:74:CF:70   Alte Beacon Muenze 
AC:23:3F:24:98:CB	on/off drinnen
AC:23:3F:24:99:46	on/off drinnen
AC:23:3F:24:99:57	on/off drinnen
AC:23:3F:24:CC:E9 	on/off draussen
AC:23:3F:24:CC:EF	on/off draussen
AC:23:3F:24:CC:F1	on/off draussen
AC:23:3F:24:C8:AD   Gross Schwarz Beacon
AC:23:3F:24:A1:D4   Gross Weiss Beacon
AC:23:3F:24:A1:D2   Gross Weiss Beacon
AC:23:3F:24:A2:0E   Gross Weiss Beacon
AC:23:3F:24:AF:84	Die Ganz duenne Beacon E8 out
AC:23:3F:24:AF:81 	Die Ganz duenne Beacon E8 alt
AC:23:3F:24:AF:77 	Die Ganz duenne Beacon E8 neu