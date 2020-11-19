<?php 


include ('config.inc.php');
include ('connexion.inc.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../CSS/products-back.css">
    <script type="text/Javascript" src="JS/script.js" defer></script>
</head>
<body>

<?php
$pCode = $_GET["productCode"];
$request = $mysqli->query("SELECT * FROM products WHERE productCode = '$pCode'");
$product = $request->fetch_object();

?>

<form id="update-form" method="POST" action="productsupdate2.php">

<div id="product-form-1">
    <label for="productCode">Code Produit<input id="product-code-input" name="productCode" type="text" value="<?php echo $product->productCode; ?>"/></label>
    <label for="productName">Nom du Produit<input id="product-name-input" name="productName" type="text" value="<?php echo $product->productName; ?>"/></label>
</div>
<div id="product-form-2">
    <textarea id="product-short-input"name="shortDescription" type="text"><?php echo $product->shortDescription; ?></textarea>
    <textarea id="product-long-input" name="longDescription" type="text"><?php echo $product->longDescription; ?></textarea>
</div>  
    <p>Marque</p>
    <select id="product-brand-input" name="brandName">
        <?php 
        $brandsrequest = $mysqli->query('SELECT * FROM brands');
        while ($brands = $brandsrequest->fetch_object()) {
            if($brands->brandCode == $product->brandCode) {
            ?>
                <option selected><?php echo $brands->brandName ?></option>
            <?php } else {?>  
                <option><?php echo $brands->brandName ?></option>
            <?php } 
            };
            ?>         
    </select>
    <p>Url de l'image</p>
    <input id="product-url-input" name="productUrl" type="text" placeholder="URL de l'image du Produit" value="<?php echo $product->productUrl; ?>"/>
    <input id="submit-update" type="submit" value="Modifier"/>

</form>


</body>
</html>
