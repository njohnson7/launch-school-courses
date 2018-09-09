/*
- trailing commas
- comment spacing

___

- move apostrophe: "Object's Prototypes"
- obscure word: "portmanteau"
- fix punctuation: "Every JavaScript Object has a special property, __proto__ (pronounced "dunder proto"; "dunder" is a portmanteau for "double underscore"), that points to another object. "
- add dash " non standard "
- #1: is there more than one method we learned...?: "Use one of the methods we learned above "
- #4:
  - snippet needs line numbers
  - " we assign foo on line 3 ~~to~~ a new object "
  - add comma: "The default prototype object, Object.prototype is "
*/
//============================================================================//


// let foo = { a: 1, b: 2 };
// let bar = Object.create(foo);

// bar.__proto__ === foo;  // true


//========================  =========================//


// let obj1 = {};
// obj1.constructor === Object;  // true

// let obj2 = new Object;
// obj2.constructor === Object;  // true

// let num = new Number(3);
// num.constructor === Number;   // true


// let proto = {};
// let obj   = Object.create(proto);

// Object.getPrototypeOf(obj) === proto;          // true
// Object.getPrototypeOf(obj) === obj.__proto__;                 // true
// p();


//========================  =========================//


// function Foo() {}

// let bar    = new Foo();
// let strObj = new String();

// bar    instanceof Foo;     // true
// bar    instanceof Object;  // true
// strObj instanceof String;  // true
// strObj instanceof Object;  // true


//========================  =========================//

// function Foo() {}

// let bar    = new Foo();
// let strObj = new String();

// Foo.prototype.isPrototypeOf(bar);        // true
// Object.prototype.isPrototypeOf(bar);     // true
// String.prototype.isPrototypeOf(strObj);  // true
// Object.prototype.isPrototypeOf(strObj);  // true

// String.isPrototypeOf(strObj);            // false
// Object.isPrototypeOf(strObj);            // false


//========================  =========================//



// let foo = { a: 1, b: 2 };
// let bar = Object.create(foo);

// p(Object.getPrototypeOf(bar) === foo);   // true
// p(foo.isPrototypeOf(bar));               // true


//========================  =========================//


// defining constructors
function C() {}
function D() {}

let o = new C();

o instanceof C;                 // true, because:
o.__proto__ === C.prototype;    // true

o instanceof D;                 // false, because:
// D.prototype is nowhere in o's prototype chain

o instanceof Object;            // true, because:
C.prototype instanceof Object;  // true

C.prototype = {};
let o2      = new C();

o2 instanceof C;        // true

o instanceof C;         // false, because:
// C.prototype is nowhere in o's prototype chain anymore

D.prototype = new C();  // add C to [[Prototype]] linkage of D
let o3      = new D();
o3 instanceof D;        // true
o3 instanceof C;        // true, because:
// C.prototype is now in `o3`'s prototype chain


//========================  =========================//


// let strObj = new String();

// p(String.isPrototypeOf(strObj));
// p(String.prototype.isPrototypeOf(strObj));
// p(strObj instanceof String);
// p(strObj instanceof String.prototype);


//========================  =========================//


// let foo = { a: 1, b: 2 };
// let bar = Object.create(foo);
// let baz = Object.create(bar);
// let qux = Object.create(baz);

// p(Object.getPrototypeOf(qux) === baz);  // true
// p(Object.getPrototypeOf(baz) === bar);  // true
// p(Object.getPrototypeOf(bar) === foo);  // true

// p(foo.isPrototypeOf(qux));  // true, because foo is on qux's prototype chain


//========================  =========================//


// let foo = { a: 1, b: 2 };
// let bar = Object.create(foo);
// let qux = Object.create(bar);

// p(foo.isPrototypeOf(qux));          // true

// // p(Object.getPrototypeOf(baz) === bar);  // true
// // p(Object.getPrototypeOf(bar) === foo);  // true


// // p(foo.isPrototypeOf(baz));  // true, because foo is on qux's prototype chain


//========================  =========================//

// let foo = { a: 1, b: 2 };     // created with object literal
// p(Object.getPrototypeOf(foo) === Object.prototype);  // true






//=============================== PROBLEMS ================================//

//======================== 1  =========================//

// let prot = {};
// let foo  = Object.create(prot);

// p(Object.getPrototypeOf(foo) === prot);  // true
// p(prot.isPrototypeOf(foo));              // true
// p(foo.__proto__ === prot);               // true
// p();


//======================== 2 =========================//

// p(Object.getPrototypeOf(foo) === prot);  // true


//======================== 3 =========================//

// p(prot.isPrototypeOf(foo));              // true


//======================== 4 =========================//

let prot = {};
let foo  = Object.create(prot);

p(Object.prototype.isPrototypeOf(foo));





//============================================================================//



let foo = {};
let bar = Object.create(foo);

bar.constructor;
bar.constructor === {}.constructor;
bar.__proto__   === foo;

