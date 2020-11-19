<?php 
$mysqli = new mysqli($dbHost, $dbUser, $dbPass, $dbDatabase);
 if ($mysqli->connect_errno){
     echo "echec lors de la connexion à MySQL : (" . $mysqli->connect_erno . ')' . 
     $mysqli->connect_error;
 }

 else {
    
 }
?> 
