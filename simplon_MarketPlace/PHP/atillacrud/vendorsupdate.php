<?php

include('vendorsconnexion.inc.php');

$pCode = $_GET["vendorCode"];
$request = $mysqli->query("SELECT * FROM vendors WHERE vendorCode = '$pCode'");
$product = $request->fetch_object();

?>

<form id="updating-form" method="POST" action="vendorsupdate2.php">

    <input name="vendorCode" type="text" value="<?php echo $product->vendorCode; ?>"/>
    <input name="vendorName" type="text" value="<?php echo $product->vendorName; ?>"/>
    <textarea name="vendorDescription" type="text"><?php echo $product->vendorDescription; ?></textarea>
    
    <input id="submitting-update" type="submit" value="Modifier"/>

</form>
