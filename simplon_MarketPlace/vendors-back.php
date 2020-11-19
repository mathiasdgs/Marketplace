
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
    <link rel="stylesheet" href="CSS/vendors-back.css">
    <script type="text/Javascript" src="JS/script.js" defer></script>
</head>
<body>

<div id="back-office-vendors-display">
    <a href="back-office.php" class="switch-to-back" title="Back-Office">B</a>
    <?php include('PHP/atillacrud/vendorsdisplay.inc.php');?>
    </div>





</body>
</html>
