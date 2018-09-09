/*
- function keyword spacing
- comment spacing

___

- #1: add 'or both': "A higher-order function must either:"
- #2:
  - remove comma: ", and why?"
  - change "--" to emdash (x2)
- #2, #3: remove `(2)` from comment
- #3: semicolon after return statement
- #3, #4, #5: make `// implement this function` formatting consistent
- #4: wrap string return value in quotes
- #5:
  - only show function definition in solution to make consistent with #3 and #4
  - semicolon after return statement
*/
//======================== 3 =========================//

// let numbers = [1, 2, 3, 4];
// function makeCheckEven() {
//   return function (num) {
//     return num % 2 === 0;
//   };
// }

// let checkEven = makeCheckEven();

// p(numbers.filter(checkEven));    // [2, 4]


// let numbers = [1, 2, 3, 4];
// const makeCheckEven = _ => n => !(n % 2);

// let checkEven = makeCheckEven();

// p(numbers.filter(checkEven));    // [2, 4]



//======================== 4 =========================//

// function execute(func, operand) {
//   return func(operand);
// }

// p(execute(function (number) {
//   return number * 2;
// }, 10));                         // 20

// p(execute(function (string) {
//   return string.toUpperCase();
// }, 'hey there buddy'));          // "HEY THERE BUDDY"



// const execute = (func, op) => func(op);

// p(execute(n => n * 2, 10));

// p(execute(str => str.toUpperCase(), 'hey there buddy'));



//======================== 5 =========================//

function makeListTransformer(func) {
  return function (list) {
    return list.map(func);
  };
}

var timesTwo = makeListTransformer(function (number) {
  return number * 2;
});

p(timesTwo([1, 2, 3, 4]));    // [2, 4, 6, 8]



const makeListTransformer = func => list => list.map(func);

const timesTwo = makeListTransformer(num => num * 2);

p(timesTwo([1, 2, 3, 4]));    // [2, 4, 6, 8]
