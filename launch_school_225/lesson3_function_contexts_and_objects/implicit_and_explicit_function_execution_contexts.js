/*
- trailing commas
- `function` keyword spacing
- semicolons after obj literal assignments
- comment spacing
- single quoted strings in (some) comments

___

- "binding works in JavaScript is a very important but ~~a~~ somewhat "
- second code snippet line 9 is missing `var` keyword: `bar = Object.foo;`
- " implicit execution context is bound upon invocation, not upon ~~declaration~~ [definition]."
- fix spacing: `var ipad   =`
- add newline after `ipad` definition
- add dots and comma at end:
  - `someObject.someMethod.call(context, arg1, arg2, arg3..)`
  - `someObject.someMethod.apply(context, [arg1, arg2, arg3..])`

*/



// function foo() {
//   return `this: ${this}`;
// }

// p(foo());

//========================  =========================//

// let object = {
//   foo() {
//     return `this: ${this}`;
//   },
// };

// p(object.foo()); // this: [object Object]
// let bar = object.foo;
// p(bar());        // this: [object Window]



// let obj = {
//   getThis() {
//     return this;
//   },
// };

// let foo = obj.getThis;

// p(obj === obj.getThis()); // true
// p(obj === foo());         // false
// p(window === foo());      // true

// p(obj.getThis());
// p(foo());
// p();

//========================  =========================//

// var a = 1;
// let obj = { a: 'hi' };

// function foo() {
//   return this.a;
// }

// const bar = _ => this.a;

// p(foo());          // 1
// p(foo.call(obj));  // "hi"

// p(bar());          // 1
// p(bar.call(obj));  // 1
// p();


//========================  =========================//

var a = 100;
var b = 200;
let strings = {
  a: 'hi',
  b: 'dog',
  add() {
    return this.a + this.b;
  },
};

let nums = { a: 4, b: 2 };

p(strings.add());            // "hidog"
p(strings.add.call(nums));   // 6
p(strings.add.call(window)); // 300

//========================  =========================//

let iPad   = { name: 'iPad',   price: 40000 };
let kindle = { name: 'kindle', price: 30000 };

function printLine(lineNum, punct) {
  p(`${lineNum}: ${this.name}, ${this.price / 100} dollars${punct}`);
}

printLine.call(iPad,   1, ';');
printLine.call(kindle, 2, '.');
