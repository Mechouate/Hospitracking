<?php
$pdo = new PDO('mysql:host=localhost;dbname=raum', 'root', 'naima');
$sql = "SELECT * FROM objekt_information";
foreach ($pdo->query($sql) as $row) {
   echo $row['objekt_id']."<br />";
   echo $row['objekt_mac_adr']."<br />";
   echo $row['create_date']."<br />";
   echo $row['RSSI_Max1']."<br />";
   echo $row['RSSI_Max2']."<br />";
   echo $row['RSSI_Max3']."<br />";
   echo $row['Mittelwert']."<br />";
   echo $row['Maximum']."<br />";
   echo $row['objekt_ort']."<br /><br />";
}
?>

<?php
$pdo = new PDO('mysql:host=localhost;dbname=raum', 'root', '11naima22');
$sql = "SELECT * FROM objekt_information";
?>
<table>
<?php
foreach ($pdo->query($sql) as $row) {
echo "<tr>";
echo "<td>".$row['objekt_id']."</td> <td>".$row['objekt_mac_adr']."</td> <td>".$row['create_date']."</td> <td>".$row['RSSI_Max1']."</td> <td>".$row['RSSI_Max2']."</td> <td>".$row['RSSI_Max3']."</td> <td>".$row['Mittelwert']."</td> <td>".$row['Maximum']."</td> <td>".$row['objekt_ort']."</td>";
echo "</tr>";
}
?>
</table>