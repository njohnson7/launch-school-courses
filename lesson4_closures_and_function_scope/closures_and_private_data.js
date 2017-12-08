/*
- function keyword spacing
- comment spacing
- double quoted strings

___

- is "context" the best word here?: "Functions close over or enclose the context at their definition point, "
- semicolon after `makeCounter` return statement
- "Number" in diagram should be lowercase
- "Note that it's impossible to access the value of count from outside the closure:"
  - comments in code snippet should be below or to right of `console.log`
  - rephrase: `// undefined: variables with closures aren't accessible from outside`
- #1:
  - `i--`
  - `i++`
  - semicolon after return statement
*/
//============================================================================//

// // function makeCounter() {
// //   let count = 0;
// //   return function () {
// //     count++;
// //     p(count);
// //   };
// // }

// function makeCounter() {
//   count = 0;
//   return _ => p(++count);
// }

// let counter = makeCounter();
// counter();
// counter();

// let counter2 = makeCounter();
// counter2();

// counter();



//======================== 1 =========================//

// // const makeCounterLogger = start =>
// //   end => [...Array(Math.abs(start - end) + 1)].forEach((_, i) => p(start + i * Math.sign(end - start)));

// function makeCounterLogger(start) {
//   return function (end) {
//     let increment = Math.sign(end - start);
//     for (let i = start; i !== end + increment; i += increment) p(i);
//   };
// }

// let countlog = makeCounterLogger(5);
// countlog(8);
// // 5
// // 6
// // 7
// // 8
// p();

// countlog(2);
// // 5
// // 4
// // 3
// // 2


//======================== 2 =========================//

function makeList() {
  let arr = [];
  return function (todo) {
    if (!todo) {
      arr.length ? arr.forEach(item => p(item)) : p('The list is empty.');
      return;
    }

    let idx = arr.indexOf(todo);
    if (~idx) {
      arr.splice(idx, 1);
      p(`${todo} removed!`);
    } else {
      arr.push(todo);
      p(`${todo} added!`);
    }
  };
}

let list = makeList();
list();
// The list is empty.
p();

list('make breakfast');
// make breakfast added!
p();

list('read book');
// read book added!
p();

list();
// make breakfast
// read book
p();

list('make breakfast');
// make breakfast removed!
p();

list();
// read book
p();
