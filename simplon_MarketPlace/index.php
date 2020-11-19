
<?php include ('PHP/config.inc.php');
include ('PHP/connexion.inc.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simplon Market Place</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="CSS/style.css">
    <script type="text/Javascript" src="JS/script.js" defer></script>
</head>
<body>

    <div id="page-container">

        <div id="formulaire">
            <from id='search'>
            <input  type="text" id="search-input" placeholder="Rechercher un produit"/>
            <input type="button" id="search-button" />  
</form>
            <img src="CSS/market.png" alt="logo" class='img-market'>
            <select id="select-categories">
            <option value=''>Selectionner une catégorie</option>";
            <?php $result = $mysqli->query('SELECT* FROM categories');
        $row =  $result->fetch_all();
        for($i=0;$i<sizeof($row);$i++){ 

            echo "   <option value='{$row[$i][1]}'>{$row[$i][1]}</option>";
        }
        ?>
        </select>
            <a href="back-office.php" id="switch-back-office" title="Back-Office"   >B</a>
        </div>
        <div id="products-page">
        <?php include('PHP/boucle-brand.inc.php');
        ?>
</div>
</div>



</body>
</html>
