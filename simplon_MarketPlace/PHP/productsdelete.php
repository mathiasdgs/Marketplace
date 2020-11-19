<?php 

include ('config.inc.php');
include ('connexion.inc.php');

$pCode = $_GET["productCode"];
$mysqli->query("DELETE FROM products WHERE productCode = '$pCode'");

header('Location: ../products-back.php');
exit();

?>