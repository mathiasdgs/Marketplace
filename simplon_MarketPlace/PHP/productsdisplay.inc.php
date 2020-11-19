<?php include ('config.inc.php');
include ('connexion.inc.php');


?>
<a id="product-add" href="PHP/productsadd.php">Ajouter un nouveau Produit</a>

<?php
$request = $mysqli->query('SELECT * FROM products');

while ($products = $request->fetch_object()) {

    ?>
    <div class="products-element">

    <a class="product-button-delete" href="PHP/productsdelete.php?productCode=<?php echo $products->productCode; ?>">X</a>

    <p>Product Code: <?php echo $products->productCode; ?></p> 
    <p>Product Name: <?php echo $products->productName; ?></p> 
    <p>Product Short Description: <?php echo $products->shortDescription; ?> </p> 
    <p>Product Long Description: <?php echo $products->longDescription; ?> </p>
    <p>Product Brand: 
    <?php 

        $concat = 'SELECT brandName FROM brands WHERE brandCode = '.$products->brandCode;
        $request2 = $mysqli->query($concat);
        $result = $request2->fetch_object();
        echo $result->brandName;

    ?>
    </p> 

    <a class="product-button-update" href="PHP/productsupdate.php?productCode=<?php echo $products->productCode; ?>">U</a>

    </div>

<?php
 }
 ?>