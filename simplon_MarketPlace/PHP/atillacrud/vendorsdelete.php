<?php

include('vendorsconnexion.inc.php');

$pCode = $_GET["vendorCode"];

$mysqli->query("SET FOREIGN_KEY_CHECKS=0;");
$mysqli->query("DELETE FROM vendors WHERE vendorCode = '$pCode';");
$mysqli->query("SET FOREIGN_KEY_CHECKS=1;");

header('Location: ../../index.php');
exit();

?>
