<?php 

include ('config.inc.php');
include ('connexion.inc.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simplon Market Place</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../CSS/products-back.css">
    <script type="text/Javascript" src="JS/script.js" defer></script>
</head>
<body>

<form id="add-request" method="POST" action="productsadd2.php">

<div id="product-form-1">
<label for="productCode">Code Produit<input id="product-code-input" name="productCode" type="text" placeholder="Code du produit"/></label>
<label for="productName">Nom du Produit<input id="product-name-input" name="productName" type="text" placeholder="Nom du Produit"/></label>
</div>
<div id="product-form-2">
<textarea id="product-short-input" name="shortDescription" placeholder="Courte Description du Produit"></textarea>
<textarea id="product-long-input" placeholder="Longue Description du Produit"></textarea>
</div>
<p>Marque</p>
<select id="product-brand-input" name="brandName">
        <?php 
        $brandsrequest = $mysqli->query('SELECT * FROM brands');
        while ($brands = $brandsrequest->fetch_object()) {
            ?>
                <option selected><?php echo $brands->brandName ?></option>
            <?php } ?>         
</select>
<p>Url de l'image</p>
<input id="product-url-input" name="productUrl" type="text" placeholder="URL de l'image du Produit"/>
<input id="submit-add" type="submit" value="Ajouter le produit"/>
</form>


</body>
</html>
