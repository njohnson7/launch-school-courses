/*
- function keyword spacing
- trailing commas
- single quoted strings in comments
- comment spacing

___

- in comment: "this" --> `this`
- semicolon after `bind` definition
- remove `()` from: "  is that bind()'s context "
- typo: `morning: 'Buenos d‚àö‚â†as, ',`
- semicolon after `spanishWords` definition


*/
//========================  =========================//


var a = 'goodbye';
let object = {
  a: 'hello',
  b: 'world',
  foo() {
    return `${this.a} ${this.b}`;
  },
};

let bar = object.foo;
p(bar());       // "goodbye undefined"

let baz = object.foo.bind(object);
p(baz());             // "hello world"

let object2 = { a: 'hi', b: 'there' };

p(baz.call(object2)); // "hello world"
p(baz)

//========================  =========================//

// Function.prototype.bind = function () {
//   let fn = this;
//   let args = Array.prototype.slice.call(arguments);
//   let context = args.shift;

//   return function () {
//     fn.apply(context, args.concat(Array.prototype.slice.call(arguments)));
//   };
// };

//========================  =========================//

