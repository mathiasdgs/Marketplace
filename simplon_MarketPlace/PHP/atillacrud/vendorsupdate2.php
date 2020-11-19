<?php

include('vendorsconnexion.inc.php');

$vendorCode = $_POST["vendorCode"];
$vendorName = $_POST["vendorName"];
$vendorDescription = $_POST["vendorDescription"];

$mysqli->query("UPDATE vendors SET vendorCode = '$vendorCode', vendorName = '$vendorName', vendorDescription = '$vendorDescription'

 WHERE vendorCode = '$vendorCode'
	");

header('Location: ../../index.php');
exit();

?>
