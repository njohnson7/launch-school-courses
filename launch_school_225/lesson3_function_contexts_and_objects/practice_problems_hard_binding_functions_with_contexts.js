/*
- trailing commas
- dobule quoted strings

___

- "What ~~function~~ [method] can we use to permanently bind a function to a particular execution context?"
- #2: semicolon after `obj` def
- #4: " despite the fact that [the] function is invoked as a method "
- #5: " with otherObj as [the] explicit context argument."



*/

//======================== 4 =========================//

let a = { msg: 'A' };
let b = { msg: 'B' };

function foo() {
  return this.msg;
}

b.c = foo.bind(a);
b.d = foo;

p(b.c());
p(b.d());

//======================== 5 =========================//

var obj      = { a: 'A' };
var otherObj = { a: 'B' };

function foo() {
  console.log(this.a);
}

var bar = foo.bind(obj);

bar.call(otherObj);
