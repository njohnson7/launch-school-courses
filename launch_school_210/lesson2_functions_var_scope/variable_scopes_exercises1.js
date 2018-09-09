// /*----------------- 1 -------------------*/ console.log('-------- 1 ---------');
// var a = 'outer';        // declare var a and set to 'outer'

// function testScope() {  // declare function --> new scope
//   var a = 'inner';      // declare inner var a, shadows outer var
//   console.log(a);       // >> 'inner' b/c of shadowing
// }

// console.log(a);         // >> 'outer' b/c inner a is in another scope
// testScope();            // >> 'inner' b/c of shadowing
// console.log(a);         // >> 'outer' b/c the inner a is a separate unrelated var







// /*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');
// var a = 'outer';        // declare global var a and set to 'outer'

// function testScope() {  // new scope
//   a = 'inner';          // reassignment of global var, a
//   console.log(a);       // >> 'inner'
// }

// console.log(a);         // >> 'outer' -- a resolves as the global var
// testScope();            // reassigns global var a to 'inner'
// console.log(a);         // >> 'inner'








/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');
// var basket = 'empty';    // global var basket

// function goShopping() {  // global function goShopping
//   function shop1() {     // local function shop1()
//     basket = 'tv';       // reassign global var basket
//   }

//   console.log(basket);   // >> 'empty', resolves to global var

//   function shop2() {
//     basket = 'computer'; // reassign basket 'computer'
//   }

//   function shop3() {
//     var basket = 'play station'; // declare and initialize new local var, basket
//     console.log(basket);         // >> 'play station' -- resolves to local var b/c of shadowing
//   }

//   shop1(); // reassing global basket to 'tv'
//   shop2(); // reassign global basket to 'computer'
//   shop3(); // >> 'play station' -- new local var basket declared and initialized

//   console.log(basket); // >> 'computer'
// }

// goShopping();
// // >> 'empty'
// // >> 'play station'
// // >> 'computer'







/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');
// function hello() {
//   a = 'hello'; // new global var is declared and set
// }

// hello();
// console.log(a); // >> 'hello' -- a resolves to global var set in hello()








/*---------------- 5 ----------------*/ console.log('\n\n-------- 5 ---------');
// function hello() {
//   var a = 'hello';   // local var a declared and set
// }

// hello();
// console.log(a); // ReferenceError
// // local var a is confined to the inner scope of hello(), so an error is raised






/*---------------- 6 ----------------*/ console.log('\n\n-------- 6 ---------');
// console.log(a); // >> undefined
// var a = 1;
// the declaration of global var a is hoisted to above the call to console.log()
//  but the assignment doesn't happen until after the call, so a has a value of
//  undefined when the method is invoked.








/*---------------- 7 ----------------*/ console.log('\n\n-------- 7 ---------');
console.log(a);

function hello() {
  a = 1;
}

// equivalent to:
function hello() {
  a = 1;
}
console.log(a); // >> ReferenceError

// this will raise an error b/c we never invoke the function
