<?php
session_start();

if($_POST){
    if(isset($_POST['categoryNumber']) && !empty($_POST['categoryNumber'])
    && isset($_POST['categoryName']) && !empty($_POST['categoryName'])){
        //Inclusion de la connexion à la base
        require_once('connectcategory.php');

        //supprimer les balises de l'URL envoyé
        $name = strip_tags($_POST['categoryNumber']);
        $adress = strip_tags($_POST['categoryName']);
        

        $sql = 'INSERT INTO `categories`(`categoryNumber`,`categoryName`) VALUES(:categoryNumber, :categoryName)';
        $query = $db->prepare($sql);

        $query->bindValue(':categoryNumber',$name,PDO::PARAM_STR);
        $query->bindValue(':categoryName',$adress,PDO::PARAM_STR);
        

        $query->execute();
        $_SESSION['message'] = "Nouvelle catégorie Ajouté";
        require_once('closecategory.php');

        header('Location: ../categories-back.php');
    }else{
        $_SESSION['erreur'] = "Le formulaire est incomplet";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/stylecategorie.css">
    <title>Ajouter une catégorie</title>

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
                <h1>Ajouter une catégorie </h1>
                <form method="post">
                    <div class="form-group">
                        <label for="categoryNumber">ID de la categorie</label>
                        <input type="text" name="categoryNumber" id="categoryNumber" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="categoryName">Nom de la catégorie</label>
                        <input type="text" name="categoryName" id="categoryName" class="form-control">
                    </div>

                    
                    <button class="btn btn-primary">Valider</button>
                </form>
            </section>
        </div>
    </main>
</body>
</html>