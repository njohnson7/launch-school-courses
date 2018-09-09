/*
- function keyword spacing
- double quoted strings (except for #1)
- comment spacing

___

- #1:
  - missing semicolon (also #2, #5)
  - rephrase, and add additional info about why it doesn't execute: "No, the code won't execute, instead producing a syntax error."
     - this works, for example:

```js
function a() {
  console.log("Sometimes, syntax isn't intuitive!")
}(1);

a();    // Sometimes, syntax isn't intuitive!
```

- #2:
  - "Edit the code from problem ~~one~~ [1] ~~such~~ [so] "
  - there are also other possible valid answers, such as in the above example -- maybe rephrase question to make more specific
- #3:
  - add line numbers to snippet(s) (at least first snippet and maybe second)
  - move `var` to top (x2, also #4 x1)
  - "it ~~,~~ so that [the] code runs without error."
  - " but sum ~~in fact~~ [actually] references"
  - remove extra space: `sum  +=`
  - appropriate use of indentation...? (in Solution snippet -- inconsistent with first snippet)
  - `return sum` could be changed to: `return sum += number` (x2)
  - wrapping the IIFE in parens isn't necessary -- but maybe makes it more clear
  - add comment with return value in Solution
- #4: newline after `for` block
- #5:
  - isn't the IIFE itself a named function expression...?: "Will the named function ***inside of*** this IIFE "
  - add more explanation -- e.g., 'why is this the case?': "No. Although the function is named, it isn't visible outside of the scope created by the IIFE."
- #6:
  - add space: `recursiveSub(n -1);`
  - missing semicolon: `console.log(n)`
*/
//============================================================================//

//======================== 1 =========================//

// function a() {
//   console.log("Sometimes, syntax isn't intuitive!")
// }(1);

// a();    // Sometimes, syntax isn't intuitive!



//======================== 2 =========================//

// (function() {
//   p("Sometimes, syntax isn't intuitive!");
// })();

// p();



//======================== 3 =========================//

// let sum = 0;
// sum += 10;
// sum += 31;

// let numbers = [1, 7, -3, 3];

// // let toAdd = function (arr) {
// //   return arr.reduce((sum, n) => sum + n, 0);
// // }(numbers);

// let toAdd = (arr => arr.reduce((sum, n) => sum + n, 0))(numbers);

// sum += toAdd;
// p(sum);        // 49

//======================== given solution modifications =========================//

// var sum = 0;

// sum += 10;
// sum += 31;

// var numbers = [1, 7, -3, 3];

// sum += function (arr) {
//   return arr.reduce(function (sum, number) {
//     return sum += number;
//   }, 0);
// }(numbers);

// p(sum);          // 49



//=========================================== aside =========================//

// let nums = [1, 2, 3];

// function sum(nums) {
//   return nums.reduce((sum, n) => sum + n, 0);
// }

// p(sum(nums));

//=========================================== /aside =========================//




//======================== 4 =========================//

// (function (n) {
//   for (let i = n; i >= 0; i--) p(i);
//   p('Done!');
// })(7);


// (n => [...Array(++n), 'Done!'].forEach(x => p(x || --n)))(7);


// const countdown = n => (_ => [...Array(++n), 'Done!'].forEach(x => p(x || --n)))();

// countdown(7);
// countdown(3);



// function countdown(count) {
//   (function (n) {
//     for (let i = n; i >= 0; i -= 1) p(i);
//     p('Done!');
//   })(count);
// }

// countdown(7);
// countdown(3);




//======================== 5 =========================//

// (function foo() {
//   p('Bar');
// })();

// foo();  // ?



//======================== 6 =========================//

// function countdown(n) {
//   (function foo(x) {
//     if (x < 0) {
//       p('Done!');
//       return;
//     }
//     p(x);
//     foo(--x);
//   })(n);
// }


function countdown(n) {
  (function foo(x) {
    x < 0 ? p('Done!') : foo(p(x) - 1);
  })(n);
}

countdown(7);
