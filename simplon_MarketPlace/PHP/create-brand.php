
<?php  include ('config.inc.php');
$mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbDatabase);
if ($mysqli->connect_errno){
    echo "echec lors de la connexion à MySQL : (" . $mysqli->connect_erno . ')' . 
    $mysqli->connect_error;
}
else {
    echo 'Connexion Réussie';
}






?> 

<html> 
<body> 
<form method='POST' action='create-brand.php'>
<input name='newname' type='text' placeholder='Nom de la marque'required >
<input name='modifier' type='submit' value='créer'>

<a href='test-brand.php'>retour </a>


<?php 
$nameUpdate = $_POST['newname'];
if(!empty($nameUpdate)){
$result = $mysqli->query("INSERT INTO brands (`brandName`) VALUES ('$nameUpdate')");
if ($result == TRUE) :
echo $nameUpdate. "  a été créé";

else :
    echo 'ECHEC';

endif;
}


?>











