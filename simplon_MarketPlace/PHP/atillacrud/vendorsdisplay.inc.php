<?php

include('vendorsconnexion.inc.php');

?>

<a id="vendor-add" href="PHP/atillacrud/vendorsadd.php">Ajouter un nouveau Vendor</a>

<?php
$request = $mysqli->query('SELECT * FROM vendors');

while ($vendors = $request->fetch_object()) {

    ?>
    <div class="vendors-element">

    <a class="vendor-button-delete" href="PHP/atillacrud/vendorsdelete.php?vendorCode=<?php echo $vendors->vendorCode; ?>">DELETE!</a>

    <p>Vendor Code: <?php echo $vendors->vendorCode; ?></p> 
    <p>Vendor Name: <?php echo $vendors->vendorName; ?></p> 
    <p>Vendor Description: <?php echo $vendors->vendorDescription; ?> </p>

    <a class="vendor-button-update" href="PHP/atillacrud/vendorsupdate.php?vendorCode=<?php echo $vendors->vendorCode; ?>">Update</a>

    </div>

<?php
 }
 ?>
