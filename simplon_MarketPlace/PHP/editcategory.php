<?php
session_start();

if($_POST){
    if(isset($_POST['categoryNumber']) && !empty($_POST['categoryNumber'])
    && isset($_POST['categoryName']) && !empty($_POST['categoryName'])){
        //Inclusion de la connexion à la base
        include('connectcategory.php');

        //supprimer les balises de l'URL envoyé
        $id = intval($_POST['categoryNumber']);
        $name = ($_POST['categoryName']);
       
        $toto = "UPDATE categories SET categoryName = '$name'  WHERE categoryNumber = $id";

        $db->query($toto);
      
      
   

        header('Location: ../categories-back.php');
    }else{
        $_SESSION['erreur'] = "Le formulaire est incomplet";
    }
}


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

        // var_dump($categories);

//Vérifier si la catégorie existe
if(!$categories){
    $_SESSION['erreur']="cet id n'existe pas";
    header('Location: ../categories-back.php');
}

}else{
    $_SESSION['erreur'] = "URL Invalide";
    header('Location: ../categories-back.php');
    // var_dump($categories);
    
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylecategorie.css">
    <title>Modifier une categorie</title>

</head>
<body>
    <main class="contain">
        <div class="csd">
            <section class="sectionphp">
                <?php
                    if(!empty($_SESSION['erreur'])){
                        echo'<div class ="alert alert-danger" role= "alert">'. $_SESSION['erreur'].'
                        </div>';
                        $_SESSION['erreur']='';
                    }
                ?>
                <h1>Modifier la categorie</h1>
                <form method="post">
                    <div class="form-group">
                        <label for="categoryName">Nom de la categorie</label>
                        <input type="text" name="categoryName" id="categoryName" class="form-control" value="<?php echo $categories['categoryName'] ?>">
                    </div>

                    <input type="hidden" value="<?php echo $categories['categoryNumber'] ?>" name="categoryNumber">
                    <button class="btn btn-primary">Valider</button>
                </form>
             
            </section>
        </div>
    </main>
</body>
</html>