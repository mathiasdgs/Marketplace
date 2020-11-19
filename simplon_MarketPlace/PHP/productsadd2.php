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

$mysqli->query("INSERT INTO products (productCode, productName, shortDescription, longDescription, brandCode, productUrl) VALUES ('$productCode', '$productName', '$shortDescription', '$longDescription', '$actualBrand', '$productUrl')");

// besoin d'updater la page d'accueil pour voir les modif/refresh liste produits?

header('Location: ../products-back.php');
exit();
?>