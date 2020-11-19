<?php include ('config.inc.php');
include ('connexion.inc.php');
var_dump($dbUser);


?>
<html>
<head>
    <link rel="stylesheet" href="style.css">
    <title>BR| Connexion a une base de données </title>
</head>
<body>


 <h2> <?php echo 'Marques' ?> </h2> 

<a href='create.php'> <h3> + Ajouter une nouvelle marque </h3></a>
<?php $result = $mysqli->query('SELECT* FROM brands');

$row =  $result->fetch_all();

for($i=0;$i<sizeof($row);$i++){
    echo "<form method='POST' action='supprimer.php'>";
    echo "<div class='row'>"; 
    echo "<input type='text' class='form__input' name='name' value={$row[$i][1]}>";
    echo ('  ');
 
    echo "<input name='id' class='form__input' type='hidden' value={$row[$i][0]}>";
    echo "<input type='submit' class='delete_input' value='X'>";
  
    echo "</form>";


    echo "<form method='POST' action='update.php'>";
    echo "<input type='hidden' name='name' value='{$row[$i][1]}'>";
    echo ('  ');

    echo "<input name='id' type='hidden' value={$row[$i][0]}>";
    echo "<input type='submit' value='Modifier'>";
    echo "</form>";
echo "</div>";
}
?> 



</body>
</html>