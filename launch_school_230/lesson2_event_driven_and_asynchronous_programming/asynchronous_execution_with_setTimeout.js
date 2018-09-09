/*
//======================== Asynchronous Execution with setTimeout =========================//
- comment spacing
- capital 'type' names (ex: "Function", "Array")
- newlines after `}`
- backticks in comments
- function keyword spacing
- `var`s at top
- `++`
- double quoted strings

- rephrase: "Part of what makes JavaScript so useful is that it has first-class Functions; functions are a regular data type in the system. First-class functions mean we can write and use higher-order Functions, such as those provided by Array objects. "
- add line numbers to first `setTimeout` snippet
- " and time in "


*/
//============================================================================//
//============================================================================//

//======================== 1 =========================//

// function delayLog() {
//   for (let i = 1; i <= 10; i++) {
//     setTimeout(_ => p(i), i * 1000);
//   }
// }

// function delayLog() {
//   [...Array(10)].forEach((_, i) => setTimeout(_ => p(++i), i * 500));
// }

// // const delayLog = _ => [...Array(10)].forEach((_, i) => setTimeout(_ => p(++i), i * 500));


// function logN(n) {
//   setTimeout(_ => p(n), n * 500);
// }

// function delayLog() {
//   [...Array(10)].forEach((_, i) => logN(++i));
// }

// delayLog();



//======================== 2 =========================//

// setTimeout(function () {    // 1
//   console.log('Once');      // 5
// }, 1000);

// setTimeout(function () {    // 2
//   console.log('upon');      // 7
// }, 3000);

// setTimeout(function () {    // 3
//   console.log('a');         // 6
// }, 2000);

// setTimeout(function () {    // 4
//   console.log('time');      // 8
// }, 4000);



//======================== 3 =========================//

// setTimeout(function() {
//   setTimeout(function() {
//     q();   // 7
//   }, 15);

//   d();     // 3

//   setTimeout(function() {
//     n();   // 5
//   }, 5);

//   z();     // 4
// }, 10);

// setTimeout(function() {
//   s();     // 6
// }, 20);

// setTimeout(function() {
//   f();     // 2
// });

// g();       // 1

// // g, f, d, z, n, s, q



//======================== 4 =========================//

function afterNSeconds(callback, seconds) {
  setTimeout(callback, seconds * 1000);
}

afterNSeconds(_ => p(42), 2);
