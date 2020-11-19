<?php
session_start();

// Est-ce que l'id existe et n'est pas vide dans l'URL

if(isset($_GET['id']) && !empty($_GET['id'])){
    require_once('connectcategory.php');
        
        //supprimer les balises de l'URL envoyé
        $id = strip_tags($_GET['id']);

        // $sql = 'SELECT * FROM `categories` WHERE `categoryNumber` = :categoryNumber;';
    
        $sql ="SELECT * FROM `categories` WHERE `categoryNumber` = ".$_GET['id'];
    
        //préparation de la requête
        $query = $db ->prepare($sql);
    
        //lier les paramètres
        $query->bindValue(':id', $id,PDO::PARAM_INT);
    
        //Exécution de la requête
        $query->execute();

        //Récupérer la catégorie

        $categories = $query->fetch();


//Vérifier si la catégorie existe
if(!$categories){
    $_SESSION['erreur']="cet id n'existe pas";
    header('location: ../categories-back.php');
    die();
}

$sql = "DELETE FROM `categories` WHERE `categoryNumber` = ".$_GET['id'];


//On prépare la requête
$query = $db->prepare($sql);

//On "accroche" les paramètre (id)
$query->bindValue(':id',$id,PDO::PARAM_INT);

// On exécute la requête
$query->execute();
$_SESSION['message'] = "catégorie supprimée";
header('location: ../categories-back.php');

}else{
    $_SESSION['erreur'] = "URL Invalide";
    header('location: ../categories-back.php');   
}
?>