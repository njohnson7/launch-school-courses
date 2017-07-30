var basket = 'empty';    // global var basket

function goShopping() {  // global function goShopping
  function shop1() {     // local function shop1()
    basket = 'tv';       // reassign global var basket
  }

  console.log(basket);   // >> 'empty', resolves to global var

  function shop2() {
    basket = 'computer'; // reassign basket 'computer'
  }

  function shop3() {
    var basket = 'play station'; // declare and initialize new local var, basket
    console.log(basket);         // >> 'play station' -- resolves to local var b/c of shadowing
  }

  shop1(); // reassing global basket to 'tv'
  shop2(); // reassign global basket to 'computer'
  shop3(); // >> 'play station' -- new local var basket declared and initialized

  console.log(basket); // >> 'computer'
}

goShopping();
// >> 'empty'
// >> 'play station'
// >> 'computer'