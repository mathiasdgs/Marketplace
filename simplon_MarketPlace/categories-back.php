
<?php

include ('PHP/config.inc.php');
include ('PHP/connexion.inc.php');

include ('PHP/connectcategory.php');
// session_start();

// //Inclusion de la connexion à la base
// require_once('connectcategory.php');

//requète
$sql = 'SELECT * FROM `categories`';

//préparation de la requête
$query = $db->prepare($sql);

//exécution de la requête

$query->execute();

//Stockage du résultat dans un tableau associatif 
$result = $query->fetchAll(PDO::FETCH_ASSOC);

require_once('PHP/closecategory.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="CSS/stylecategorie.css">
    <script type="text/Javascript" src="JS/script.js" defer></script>
</head>
<body>


<main class="contain">
<a href="back-office.php" class="switch-to-back" title="Back-Office">B</a>
        <div class="csd">
            <section class="sectionphp">
                <table class="table">
                    <?php
                        if(!empty($_SESSION['erreur'])){
                            echo'<div class ="alert alert-danger" role= "alert">'. $_SESSION['erreur'].'
                            </div>';
                            $_SESSION['erreur']='';
                        }
                    ?>
                    <?php
                        if(!empty($_SESSION['message'])){
                            echo'<div class ="alert alert-success" role= "alert">'. $_SESSION['message'].'
                            </div>';
                            $_SESSION['message']='';
                        }
                    ?>
                    <h1>Liste des Catégories</h1>
                    <thead>
                        <th>ID</th>
                        <th>Nom</th>
                      
                    </thead>
                    <tbody>
                        <?php
                        //Boucle sur la variable result
                            foreach($result as $categories){
                        ?>
                            <tr >
                                <td id="nomid"><?php echo $categories['categoryNumber'] ?></td>
                                <td id="nomid"><?php echo $categories['categoryName'] ?></td>
                              
                                <td>
                                  <a href="PHP/detailscategory.php?id=<?php echo $categories['categoryNumber']?>">Voir</a>
                                  <a href="PHP/editcategory.php?id=<?php echo $categories['categoryNumber']?>">Modifier</a>
                                  <a href="PHP/deletecategory.php?id=<?php echo $categories['categoryNumber']?>">Supprimer</a>
                                </td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
                <a href="PHP/addcategory.php" class="btn btn-primary">Ajouter une nouvelle catégorie</a>
            </section>
        </div>
    </main>
</body>
</html>
