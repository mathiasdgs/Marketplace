<?php include ('PHP/config.inc.php');
include ('PHP/connexion.inc.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="CSS/style.css">

</head>

<body>

    

       

        <div class='product-detail-container'>

   <a href='index.php'> <Button class='retourBtn'> Retour à la page d'accueil
</Button>
</A>


            <?php 


$idProduct = $_POST['id'];
$price = $_POST['price'];

$result = $mysqli->query("SELECT productName, shortDescription, longDescription, productUrl FROM products WHERE productCode = '$idProduct'");
        
        $row =  $result->fetch_all();
$productname = $row[0][0];
$productShort = $row[0][1];
$productLong = $row[0][2];
$productUrl = $row[0][3];

$result2 = $mysqli->query("SELECT vendorCode, priceHT, shippingHT ,stock FROM products_vendors WHERE productCode = '$idProduct'");
$vendorRow =  $result2->fetch_all();






?>

            <div id='product-detail'class='apparition'>
                <div class='main-product row'>
                    <div><img src='<?php echo $productUrl ;?>'>
                    </div>

                    <div class='product-head'>
                        <h2> <?php echo $productname;?></h2>
                        <h5 class='price'> <?php echo $price;?></h5>

                        <p> <?php echo $productLong ;?>
                        <p>
                    </div>
                </div>
                <div  id='vendor-container'>
                   
                    <?php for ($j=0; $j<sizeof($vendorRow); $j++){
$vendorCode[$j] = $vendorRow[$j][0];
$vendorPrice[$j] = $vendorRow[$j][1];
$vendorShipping[$j] = $vendorRow[$j][2];
$vendorStock[$j] = $vendorRow[$j][3];
$result3 = $mysqli->query("SELECT vendorName FROM vendors WHERE vendorCode = $vendorCode[$j]");
$vendorName =  $result3->fetch_all();


?>
                    <!-- <div class='vendor row'> -->
                    <div class='column' >
                       <div class="vendor"><h5><?php echo $vendorName[0][0];?></h5>
                       <img src='CSS/profile.png' alt='logo-vendeur' class='vendor-img'>
                        <p class='price-vendor'><?php echo $vendorPrice[$j] .' €';?></p>
                        <p class='tiny-text'><?php echo '('.$vendorShipping[$j].' € de livraison)';?></p>
                        <p class='tiny-text'><?php echo '('.$vendorStock[$j].' en stock)';?></p></div>
                        <?php } ?>
                    </div>
                    </div>
                    </div>
                    <!-- </div> -->
                    </div>
                </div>

            </div>


</body>

</html>