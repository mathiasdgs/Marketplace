<?php

$dbuser = 'root';
$dbpass = '';
$dbdatabase = 'marketplace';
$dbhost = 'localhost';


$mysqli = new mysqli($dbhost, $dbuser, $dbpass, $dbdatabase);

if ($mysqli->connect_error) {
    echo 'Erreur à la connexion';
}
