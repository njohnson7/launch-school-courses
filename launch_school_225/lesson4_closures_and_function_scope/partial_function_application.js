/*
- WHOLE COURSE (or at least whole lesson): Solution button formatting inconsistent: "Solution", "Show Solution", "Show solution" (and also maybe "Hide solution", etc...)
- WHOLE COURSE: `Number` in diagrams should be lowercase

___

- function keyword spacing
- double quoted strings (in code and text)
- comment spacing
- semicolon after return statement (x4)

___

- "Note how [a/the...?] closure "
- emdash: " reusable; we "
- move to top of scope: `var i`
- `++i`
- should have `=` before return value: `HelloHelloHello` and `!!!`
*/
//============================================================================//

// const add = (a, b) => a + b;

// // const addOne = n => add(1, n);

// // p(addOne(1));
// // p(addOne(10));

// const partial = (primary, arg1) => {
//   return arg2 => primary(arg1, arg2);
// };

// const add5 = partial(add, 5);
// p(add5(10));
// p(add5(12));

// const add42 = partial(add, 42);
// p(add42(10));
// p(add42(12));
// p();

// const mult3 = partial((a, b) => a * b, 3);
// p(mult3(1));
// p(mult3(2));  // 6
// p(mult3(3));
// p(mult3(5));

// const helloX = partial(add, 'Hello ');
// p(helloX('world'));
// p();

// const repeat = (count, str) => str.repeat(count);

// const repeat5 = partial(repeat, 5);
// p(repeat5('wtf'));
// p(repeat5('!'));
// p();



//========================  =========================//

// const partial = (primary, arg1) => {
//   return arg2 => primary(arg1, arg2);
// };

// const add   = (a, b) => a + b;
// const add42 = partial(add, 42);
// p(add42(10));                        // 52

// const mult3 = partial((a, b) => a * b, 3);
// p(mult3(2));                         // 6

// const repeat  = (count, str) => str.repeat(count);
// const repeat5 = partial(repeat, 5);
// p(repeat5('!'));                     // "!!!!!"



//======================== 1 =========================//

// const greet = (msg, name) => p(`${msg[0].toUpperCase()}${msg.slice(1)}, ${name}!`);


const greet = (msg, name) => p(`${msg.replace(/^./, c => c.toUpperCase())}, ${name}!`);

greet('howdy', 'Joe');           // Howdy, Joe!
greet('good morning', 'Sue');    // Good morning, Sue!
p();



//======================== 2 =========================//

const partial = (func, arg1) => arg2 => func(arg1, arg2);

const sayHello = partial(greet, 'hello');
sayHello('Brandon');                   // Hello, Brandon!

const sayHi = partial(greet, 'hi');
sayHi('Sarah');
