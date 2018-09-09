/*
- function keyword spacing
- double quoted strings

___

- "Higher-order functions either [or both] "
- functions *are* objects: " functions are a data type like strings, numbers, and objects."
- semicolon after `helloFactory` return statement
- remove period: `// helloFactory() returns a function.`
- lowercase (x2): `// Immediate `
- `// storing return[ed] function`
- `// ... [space?] and invoking it later`
- semicolon after `timed` return statement
- actually returns `undefined` not a function: `> var timedHi = timed(function() { console.log('hi'); });
= function() { ... }`
- space after `for` keyword
- move `var i`
- fix `i++`
- newline after `for` block
- "loopy sums every number from ~~1~~ [0] to "
- clarify: "as arguments, [or as] return values, or [as] both."
*/
//========================  =========================//

function helloFactory() {
  return function () {
    p('hi');
  };
}

p(helloFactory());
helloFactory()();
let foo = helloFactory();
foo();
p();


//========================  =========================//

function timed(func) {
  return function () {
    let start = new Date();
    func();
    let stop = new Date();
    p(`${stop - start} ms have elapsed`);
  };
}

let timedHi = timed(function () { p('hi'); });
timedHi();

let timedFoo = timed(_ => [...Array(100000)].forEach(x => x + 52));
timedFoo();
p();

function loopy() {
  let sum = 0;
  for (let i = 0; i < 1000000000; i++) sum += i;
  p(sum);
}

// let timedLoopy = timed(loopy);
// timedLoopy();

timed(loopy)();
