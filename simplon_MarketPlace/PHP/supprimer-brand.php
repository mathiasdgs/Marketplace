<?php  include ('config.inc.php');
$mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbDatabase);
if ($mysqli->connect_errno){
    echo "echec lors de la connexion à MySQL : (" . $mysqli->connect_erno . ')' . 
    $mysqli->connect_error;
}
else {
    echo 'Connexion Réussie';
}

$idDelete = intval($_POST['id']);
$result = $mysqli->query("DELETE FROM brands WHERE brandCode = $idDelete");
 echo $idDelete;
 echo 'marque supprimée';

 header('Location:test-brand.php');
 exit();




?>