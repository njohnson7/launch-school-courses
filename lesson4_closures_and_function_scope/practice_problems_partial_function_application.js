/*
- function keyword spacing
- double quoted strings (in code and text)
- comment spacing

___

- #1:
  - question could be more specific, as this is currently a valid answer: `const sub5 = a => 5;`
  - comment should contain `5`: `sub5(10); //`
- #2:
  - wrap "5" in backticks
  - `;` after return statement (also #3, #5)
- #4: isn't this redundant...?: " all of the references visible to it at the moment and in the lexical location of its creation."
- #5:
  - remove quotes from property names
  - trailing commas
*/
//============================================================================//

//======================== 1 =========================//

// function subtract(a, b) {
//   return a - b;
// }

// function sub5(a) {
//   return subtract(a, 5);
// }



// const subtract = (a, b) => a - b;

// const sub5 = a => subtract(a, 5);

// // const sub5 = _ => 5;

// p(sub5(10));



//======================== 2 =========================//

const subtract = (a, b) => a - b;
const makeSubN = b => a => subtract(a, b);
const sub5 = makeSubN(5);

p(sub5(10));

const sub3 = makeSubN(3);
p(sub3(10));
p(sub3(13));



//======================== 3 =========================//

const makePartialFunc = (func, b) => a => func(a, b);
const multiply = (a, b) => a * b;
const multiplyBy5 = makePartialFunc(multiply, 5);

p(multiplyBy5(100));    // 500
p(multiplyBy5(3));      // 15

p();


//======================== 5 =========================//

let subjects = {
  English: ['Bob',    'Tyrone', 'Lizzy'],
  Math:    ['Fatima', 'Gary',   'Susan'],
  Biology: ['Jack',   'Sarah',  'Tanya'],
};

const rollCall = (subject, students) => {
  p(`${subject}:`);
  students.forEach(student => p(student));
};

const makeMathRollCall = _ => students => rollCall('Math', students);

let mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
// Math:
// Fatima
// Gary
// Susan
