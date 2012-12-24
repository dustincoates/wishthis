(function wishThisParser () {
  var productURL = window.location.href,
      productName,
      productPrice,
      productImageURL,
      destinationURL;

  //Parsers//

  function amazonParser () {
    if (!document.getElementById("btAsinTitle")) {
      return notAProductPage();
    };
    productName = document.getElementById("btAsinTitle").firstChild.nodeValue;

    productPrice = document.getElementById('actualPriceValue').firstChild.innerText;
    productPrice = Number(productPrice.replace(/[^0-9\.]+/g,""));

    productImageURL = document.getElementById('prodImage').getAttribute('src');

    createURL(productName, productPrice, productImageURL, productURL);

    openAddProductWindow(destinationURL);
  }

  function etsyParser () {
    if(!document.getElementById("item-title")) {
      return notAProductPage();
    };

    productName = document.getElementById("item-title").children[0].innerText;
    productPrice = parseFloat(
                  document.querySelectorAll(".item-amount")[0].children[1].innerText,
                  10);
    productImageURL = document.getElementById(
                      "fullimage_link1").firstChild.firstChild.getAttribute("src");

    createURL(productName, productPrice, productImageURL, productURL);

    openAddProductWindow(destinationURL);
  }

  function jcrewParser () {
    if(!document.getElementById("pdp-title")) {
      return notAProductPage();
    };
    productName = document.getElementsByTagName("h1")[0].innerHTML;
    productImageURL = document.getElementById("mainImg").getAttribute("src");

    //They appear to use two different types of price signifiers.
    if (document.getElementsByClassName("price").length > 0){
      //This is for just one price.
      productPrice = document.querySelectorAll(".price")[0].innerHTML;
    }
    else {
      //This is for multiple prices. We choose the most expensve one.
      productPrice = document.querySelectorAll(".chips-price")[0].innerHTML;
    }
    productPrice = Number(productPrice.replace(/[^0-9\.]+/g,""));

    createURL(productName, productPrice, productImageURL, productURL);

    openAddProductWindow(destinationURL);
  }



  function unsupportedParser () {
    alert("Sorry, WishThis is in limited availability and doesn't work on this site.")
  }

  //End Parsers//

  //If user isn't on a product page.
  function notAProductPage () {
    alert("Sorry, WishThis only works on product pages.");
  }

  //Create the destination URL.
  function createURL (productName, productPrice, productImageURL, productURL) {
    destinationURL = "http://localhost:3000/popup_add?product_name=" +
                      productName +
                      "&product_price=" +
                      productPrice +
                      "&product_image_url=" +
                      productImageURL +
                      "&product_url=" +
                      productURL;
    return destinationURL = encodeURI(destinationURL);
  }

  //Opens new window to add the product to the wishlist.
  function openAddProductWindow (url) {
    var newWindowFeatures = "menubar=no,location=no,resizable=yes,height=600,width=450"
    window.open(url, "addProductWindow", newWindowFeatures)
  }

  //Self executing anonymous function so it can call everything else right away.
  (function chooseParser () {
      var hostname = document.location.hostname;

      if (hostname.indexOf("amazon") !== -1) {
        amazonParser();
      }
      else if (hostname.indexOf("etsy") !== -1){
        etsyParser();
      }
      else if (hostname.indexOf("jcrew") !== -1){
        jcrewParser();
      }
      else{
        unsupportedParser();
      }
    })();
})();