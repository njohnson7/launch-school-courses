/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');
// function say() {
//   if (false) {
//     var a = 'hello from inside a block';
//   }

//   console.log(a);
// }
// say(); // >> undefined







/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');
// function hello() {
//   a = 'hello'; // define a global var, a
//   console.log(a);

//   if (false) {
//     var a = 'hello again';
//   }
// }

// hello();
// console.log(a);

// // after hoisting:
// function hello() {
//   var a;          // local var a declared
//   a = 'hello';    // local var a set to 'hello'
//   console.log(a); // >> 'hello'

//   if (false) {
//     a = 'hello again'; // never executed
//   }
// }

// hello();         // >> ='hello'
// console.log(a);  // ReferenceError b/c global var a is not declared anywhere









/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');
// var a = 'hello';

// for (var i = 0; i < 5; i++) {
//   var a = i;    // a is already declared, so reassigning global var a to i
// }

// console.log(a, i); // >> 4 b/c the block is only executed when i is less than 5
// // JS hoists the var decl. to top of global scope









/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');
// var a = 1;

// function foo() {
//   a = 2;            // a reassigned 2
//   function bar() {
//     a = 3;          // a reassigned 3
//     return 4;
//   }

//   return bar();     // 4 is returned
// }

// console.log(foo()); // >> 4
// console.log(a);     // >> 3 -- b/c a = 2 is executed before a = 3








/*---------------- 5 ----------------*/ console.log('\n\n-------- 5 ---------');
// var a = 'global';              // global var a -- keeps value

// function checkScope() {
//   var a = 'local';             // local var a declcared -- keeps value
//   function nested() {
//     var a = 'nested';          // nested local var a --> 'supernested'
//     function supernested() {
//       a = 'supernested';       // reassign nested to 'supernested'
//       return a;                // returns 'supernested'
//     }

//     return supernested();      // 'supernested'
//   }

//   return nested();             // 'supernested'
// }

// console.log(checkScope());     // >> 'supernested'
// console.log(a);                // >> 'global' b/c all other a's are out of scope








/*---------------- 6 ----------------*/ console.log('\n\n-------- 6 ---------');
// var a = 'outer';
// var b = 'outer';

// console.log(a);
// console.log(b);
// setScope(a);
// console.log(a);
// console.log(b);

// function setScope(foo) {
//   foo = 'inner';
//   b = 'inner';
// }

// // equivalent to:
// function setScope(foo) {
//   foo = 'inner'; // no effect --> foo is a new var created from params and reassigned from value of a to 'inner'
//   b = 'inner';   // resolves to global var b --> reassigns to 'inner'
// }

// var a = 'outer';
// var b = 'outer';

// console.log(a);  // >> 'outer'
// console.log(b);  // >> 'outer'
// setScope(a);     // b is reassigned to 'inner'
// console.log(a);  // >> 'outer' --> a is not modified by setScope()
// console.log(b);  // >> 'inner'








/*---------------- 7 ----------------*/ console.log('\n\n-------- 7 ---------');
// var total = 50;
// var increment = 15;

// function incrementBy(increment) {
//   total += increment;   // reassign global var total to 60
// }

// console.log(total);     // 50
// incrementBy(10);        // returns undefined, sets total to 60
// console.log(total);     // 60
// console.log(increment); // 15 -- doesn't change anywhere







/*---------------- 8 ----------------*/ console.log('\n\n-------- 8 ---------');
// var a = 'outer';

// console.log(a);
// setScope();
// console.log(a);

// var setScope = function() {
//   a = 'inner';
// }

// equiv. to:
var a;
var setScope;
a = 'outer';

console.log(a);  // 'outer'
setScope();      // TypeError
console.log(a);

setScope = function() {
  a = 'inner';
}


