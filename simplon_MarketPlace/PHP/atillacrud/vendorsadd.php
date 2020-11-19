<?php 

include('vendorsconnexion.inc.php');

?>

<form id="add-request" method="POST" action="vendorsadd2.php">

<input name="vendorCode" type="text" placeholder="Code du vendeur"/>
<input name="vendorName" type="text" placeholder="Nom du vendeur"/>
<textarea name="description" placeholder="Description du vendeur"></textarea>


<input id="submit-addati" type="submit" value="Ajouter le vendeur"/>
</form>
