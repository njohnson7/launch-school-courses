/*
- function keyword spacing

___

- #1: remove newline after `var i`
- #2:
  - " it should add or subtract that number to [or from] the running total"
  - missing semicolon after `add(1)`
- #3:
  - missing semicolon after `logWarning()`
  - missing semicolon after return statement
  - "; you can provide ~~any~~ [some] arguments ahead of time, and [provide] the others when you invoke the returned function."
- #4:
  - missing semicolon after return statement
  - maybe rephrase because, technically, the "*value* of the inner variable `status`" can be accessed outside of the closure, since it is a string.
     - for example:
          - `var systemStatus = startup.toString().match(/status = '(.*)';/)[1]; // 'ready'`
          - or just: `var systemStatus = 'ready';`
*/
//============================================================================//

//======================== 1 =========================//

// function makeMultipleLister(num) {
//   return function () {
//     for (let i = 1; i < 100; i++) {
//       if (i % num === 0) p(i);
//     }
//   };
// }


// function makeMultipleLister(num) {
//   return function () {
//     for (let i = num; i < 100; i += num) p(i);
//   };
// }


// const makeMultipleLister = num =>
  // _ => [...Array(100)].map((_, i) => ++i).filter(n => n % num === 0).forEach(n => p(n));


// const makeMultipleLister = n => _ => [...Array(100)].forEach((_, i) => ++i % n ? 0 : p(i));


// const makeMultipleLister = n => _ => [...Array(~~(100 / n))].forEach((_, i) => p(++i * n));


// let lister = makeMultipleLister(13);
// lister();



//======================== 2 =========================//

// let total = 0;
// const add      = n => p(total += n);
// const subtract = n => p(total -= n);

// add(1);        // 1
// add(42);       // 43
// subtract(39);  // 4
// add(6);        // 10



//======================== 3 =========================//

// // function later(func, arg) {
// //   return function () {
// //     func(arg);
// //   };
// // }


// const later = (func, arg) => _ => func(arg);
// const logWarning = later(console.log, 'The system is shutting down!');
// logWarning();        // The system is shutting down!


// const later2 = (func, arg) => (...args) => func(arg, ...args);
// const logWarning2 = later2(console.log, 'The system is shutting down!');
// logWarning2('wtf');  // The system is shutting down! wtf



//======================== 4 =========================//

function startup() {
  var status = 'ready';
  return function () {
    p('The system is ready.');
  };
}

var ready = startup();
var systemStatus = // ?


var systemStatus = startup.toString().match(/status = '(.*)';/)[1];
p(systemStatus);
