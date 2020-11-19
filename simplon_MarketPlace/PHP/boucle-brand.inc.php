<?php 


include ('config.inc.php');
include ('connexion.inc.php');

$result = $mysqli->query('SELECT* FROM products');
        
        $row =  $result->fetch_all();
      
      
        for($i=0;$i<sizeof($row);$i++){ 
            $result2 = $mysqli->query("SELECT DISTINCT priceHT FROM products_vendors WHERE productCode = '{$row[$i][0]}'");
            $price =  $result2->fetch_all();
            $result3 = $mysqli->query("SELECT categoryNumber FROM `products_categories` WHERE productCode = '{$row[$i][0]}'");
            $tags =  $result3->fetch_all();
          
            for ($x=0; $x<sizeof($tags); $x++){
              $result4 = $mysqli->query(" SELECT categoryName FROM categories WHERE categoryNumber = '{$tags[$x][0]}'");
              $tagname[$x] =  $result4->fetch_all();
          }
          
            
           
          
              
       ?>
         <div class='popo apparition' >
           <img class='product-img' src='<?php echo $row[$i][5];?>'>
           <div class='bottom'>
             <hr class='hr-product'>
             <p class='price'><?php if (!empty($price)){echo $price[0][0].' €';} else { echo ('En rupture de stock');
             } ?></p>
             <p class='product-name'><?php echo $row[$i][1]; ?></p>
             <form method='POST' action='detail-product.php' class='form' id='<?php echo $row[$i][0];?>'>
             <input type='hidden' name='id' value='<?php echo $row[$i][0];?>'>
             <input type='hidden' name='price' value='<?php if (!empty($price)){echo $price[0][0].' €';} else { echo ('En rupture de stock');
             } ?>'>
             <input  class='submitBtn' target='_blank'type='submit' value='Voir le produit'></input>
            </form>
             <p class='opacity'> <?php 
             if (!empty($tagname)){
             for ($j=0; $j<sizeof($tagname); $j++){ echo serialize($tagname[$j][0]);}}
             else{ echo ('');} ?></p>
            </div>
        <div id="product-details-page" class="hidden">

        </div>
    </div>
       <?php } ?>