<?php  include ('config.inc.php');
$mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbDatabase);
if ($mysqli->connect_errno){
    echo "echec lors de la connexion à MySQL : (" . $mysqli->connect_erno . ')' . 
    $mysqli->connect_error;
}
else {
    echo 'Connexion Réussie'.' ';
}

$idUpdate = intval($_POST['id']);
$nameUpdate = $_POST['name'];

echo $nameUpdate;




?> 

<html> 
<header>
<link rel="stylesheet" href="CSS/brand.css">
</header>
<body> 
<form method='POST' action='update-brand.php'>
<input name='name' type='text' class='form__input' value=<?php echo ($nameUpdate) ?> >
<input name='id' type='hidden' value=<?php echo ($idUpdate) ?> >
<input name='modifier' type='submit' value='Modifier'>

<a href='test-brand.php'>retour </a>


<?php if(!empty($nameUpdate) AND !empty($idUpdate)): 
$result = $mysqli->query("UPDATE brands SET brandName = '".$nameUpdate."' WHERE brandCode = $idUpdate");
elseif($result = TRUE):
    echo'marque obligée';

 
endif;
               

?>








<!-- 
 UPDATE table
SET nom_colonne_1 = 'nouvelle valeur'
WHERE condition
//  header('Location:test.php');
//  exit(); -->









