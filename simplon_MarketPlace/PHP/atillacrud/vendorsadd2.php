<?php

include('vendorsconnexion.inc.php');

$vendorCode = $_POST["vendorCode"];
$vendorName = $_POST["vendorName"];
$description = $_POST["description"];


$mysqli->query("INSERT INTO vendors (vendorCode, vendorName, vendordescription) VALUES ('$vendorCode', '$vendorName', '$description')");

header('Location: ../../index.php');
exit();
?>
