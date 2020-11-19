<?php
session_start();

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

        // var_dump($categories);

    //Vérifier si la catégorie existe
    if(!$categories){
        $_SESSION['erreur']="cet id n'existe pas";
        header('location: indexcategory.php');
    }

}else{
    $_SESSION['erreur'] = "URL Invalide";
    header('Location:indexcategory.php');
    // var_dump($categories);
    
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylecategorie.css">
    <title>Détails de la catégorie</title>
</head>
<body>
    <main class="contain">
        <div class="csd">
            <section class="sectionphp">
                <h1>Détails de la Catégorie </h1>
                <p>ID: <?php echo $categories['categoryNumber']?></p>
                <p>Nom: <?php echo $categories['categoryName']?></p>
                
                <p><a href="PHP/indexcategory.php">Retour</a> 
                <a href="PHP/editcategory.php?id=<?php $category['categoryNumber'] ?>">Supprimer</a>
            </p>
            </section>
        </div>
    </main>
</body>
</html>