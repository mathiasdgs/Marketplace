$backofficediv = $('#back-office-container');
$backofficebutton = $('#switch-back-office');
$frontbutton = $('#switch-front');
$pagecontainer = $('#page-container');

$backproducts = $('#back-office-products');
$backvendors = $('#back-office-vendors');
$backcategories = $('#back-office-categories');
$backbrands = $('#back-office-brands');

$backproductsdisplay = $('#back-office-products-display');
$backvendorsdisplay = $('#back-office-vendors-display');
$backcatagoriesdisplay = $('#back-office-categories-display');
$backbrandsdisplay = $('#back-office-brands-display');

$buttonstoback = $('.switch-to-back');

$backofficebutton.click(function() {
    $pagecontainer.addClass("hidden");
    $backofficediv.removeClass("hidden");
});

$frontbutton.click(function() {
    $pagecontainer.removeClass("hidden");
    $backofficediv.addClass("hidden");
});



$backproducts.click(function() {
    $backofficediv.addClass("hidden");
    $backproductsdisplay.removeClass("hidden");
});
$backvendors.click(function() {
    $backofficediv.addClass("hidden");
    $backvendorsdisplay.removeClass("hidden");
});
$backcategories.click(function() {
    $backofficediv.addClass("hidden");
    $backcatagoriesdisplay.removeClass("hidden");
});
$backbrands.click(function() {
    $backofficediv.addClass("hidden");
    $backbrandsdisplay.removeClass("hidden");
});

$buttonstoback.each(function() {
    let $actualbutton = $(this);
    console.log($actualbutton);
    $actualbutton.click(function() {
        let $actualdiv = $actualbutton.closest('div');
        $actualdiv.addClass("hidden");
        $backofficediv.removeClass("hidden");
    })
})



// <-------------------------------------- RECHERCHER UN PRODUIT --------------------------------------->
let text = document.getElementById('search-input');
text.addEventListener('keyup', searchProducts)


function searchProducts() {
    console.log(text.value);
    var filter = text.value.toUpperCase() //on pourra mettre des majuscules ou caractères spéciaux il n'y aura pas de problème

    var searchDisplay, i;
    let productClass = document.querySelectorAll(".popo");

    for (i = 0; i < productClass.length; i++) {
        productfound = productClass[i];
        searchDisplay = productfound.innerText;
        if (searchDisplay.toUpperCase().indexOf(filter) > -1) {
            productClass[i].style.display = "";

        } else {
            productClass[i].style.display = "none";

        }
    }
};

// <-------------------------------------- RECHERCHER UNE CATEGORIE --------------------------------------->

let selectText = document.getElementById('select-categories');
selectText.addEventListener('click', searchCategory);


function searchCategory() {
    console.log(selectText.value);
    var filter = selectText.value.toUpperCase() //on pourra mettre des majuscules ou caractères spéciaux il n'y aura pas de problème

    var searchDisplay, i;
    let productClass = document.querySelectorAll(".popo");

     for (i = 0; i < productClass.length; i++) {
        productfound = productClass[i];
        searchDisplay = productfound.innerText;
        if (searchDisplay.toUpperCase().indexOf(filter) > -1) {
            productClass[i].style.display = "";

        } else {
            productClass[i].style.display = "none";

        }
    }
};




// <----------------------------Cliquer sur case pour détail produit------------------------>



var prodcutBox = document.getElementsByClassName('popo');
var submitBtn = document.getElementsByClassName('submitBtn');
var form = document.getElementsByClassName('form');

console.log(prodcutBox);

console.log(form);

for (x=0; x<prodcutBox.length; x++){
Opendetail(x);
}

function Opendetail(x){
    prodcutBox[x].addEventListener('click', ()=>{
           
        console.log('x');
    submitBtn[x].click();
    });
}
    // Element.setAttribute(name, value);