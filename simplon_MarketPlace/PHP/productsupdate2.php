<?php 

include ('config.inc.php');
include ('connexion.inc.php');


$productCode = $_POST["productCode"];
$productName = $_POST["productName"];
$shortDescription = $_POST["shortDescription"];
$longDescription = $_POST["longDescription"];
$brandName = $_POST["brandName"];
$productUrl = $_POST["productUrl"];

$concat = "SELECT brandCode FROM brands WHERE brandName ='$brandName'";
$request2 = $mysqli->query($concat);
$result = $request2->fetch_object();
$actualBrand = $result->brandCode;

$mysqli->query("UPDATE products SET productCode = '$productCode', productName = '$productName', shortDescription = '$shortDescription', longDescription = '$longDescription', brandCode = $actualBrand , productUrl = '$productUrl' WHERE productCode = '$productCode'");

header('Location: ../products-back.php');
exit();

?>