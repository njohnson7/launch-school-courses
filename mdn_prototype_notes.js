/*

*/
//============================================================================//



// let o  = new Object();
// o.prop = 'exists';

// o.hasOwnProperty('prop');             // returns true
// o.hasOwnProperty('toString');         // returns false
// o.hasOwnProperty('hasOwnProperty');   // returns false



//============================================================================//



// let foo = { a: 42 };
// ({}).hasOwnProperty.call(foo, 'a');                 // true
// Object.prototype.hasOwnProperty.call(foo, 'a');     // true




//============================================================================//


// 'length' in [];  // true
// 'push'   in [];  // true





//============================================================================//


// let Foo = function () {};
// new Foo();
// (new Foo()).__proto__;

// p([].__proto__);
// p((new Array(5)).__proto__);
// p((Array(5)).__proto__);



//============================================================================//



// let foo = 42;
// p({ foo });




//============================================================================//


// const Person = function () {};

// let bob = new Person();

// Person.prototype.greet = function () {
//   p('Hello');
// };

// p(bob.greet());
// p(bob.toString());
// p(toString.call(bob));
// p(toString.call(new Date));
// p((new Date).toString());
// p(toString.call(new String));



//============================================================================//


// p('abc'.__proto__);
// p('abc'.__proto__.__proto__);
// p('abc'.__proto__.__proto__.__proto__);
// p('abc'.__proto__.__proto__.__proto__.__proto__);



//============================================================================//


// const Person = function () {};
// function foo(x) { return x + 1; }
// const bar = function () { p(42) };
// const qux = y => p(y);

// p(Person.prototype);
// p(foo.prototype);
// p(bar.prototype);
// p(qux.prototype);
// p(Object.prototype);



//============================================================================//




// let foo = { a: 1 };
// let bar = { a: 2, __proto__: foo };

// p(bar.a);    // 1
// bar.a = 2;
// p(bar.a);    // 2



//============================================================================//




// let foo = {
//   a: 5,
//   add() {
//     return this.a + 1;
//   },
// };

// let bar = Object.create(foo);
// bar.a = 10;
// p(foo.add());    // 6
// p(bar.add());    // 11



//============================================================================//



// Object.prototype.__proto__  // null


// let arr = [1, 2, 3];

// arr --> Array.prototype --> Object.prototype --> null



//============================================================================//



// function Person() {};

// p(new Person);
// p(new Person());


//============================================================================//


// let foo = Object.create(null);

// p(foo.__proto__);
// p(Object.getPrototypeOf(foo));
// p(foo);

// // prototype chain looks like:

// // foo --> null





//============================================================================//

// //======================== from MDN: =========================//
// function A(a) {
//   this.varA = a;
// }

// // What is the purpose of including varA in the prototype when
// //  A.prototype.varA will always be shadowed by
// //  this.varA, given the definition of function A above?
// A.prototype = {
//   varA: null,  // Shouldn't we strike varA from the prototype as doing nothing?
//       // perhaps intended as an optimization to allocate space in hidden classes?
//       // would be valid if varA wasn't being initialized uniquely for each instance
//   doSomething: function() {
//     // ...
//   }
// };

// function B(a, b) {
//   A.call(this, a);
//   this.varB = b;
// }
// B.prototype = Object.create(A.prototype, {
//   varB: {
//     value: null,
//     enumerable: true,
//     configurable: true,
//     writable: true
//   },
//   doSomething: {
//     value: function() { // override
//       A.prototype.doSomething.apply(this, arguments); // call super
//       // ...
//     },
//     enumerable: true,
//     configurable: true,
//     writable: true
//   }
// });
// B.prototype.constructor = B;

// var b = new B();
// b.doSomething();
// //=================================================//



//============================================================================//



// function Person() {}
// let bob = new Person();

// bob.__proto__ === Person.prototype;  // true


// // bob.[[Prototype]] = Person.prototype



//============================================================================//



// function Person() {
//   this.speak = function () {
//     p('Hi');
//   };
// }

// let bob  = new Person();
// let fred = new Person();

// p(bob.speak === fred.speak);


// p(Person.prototype.speak);              // undefined
// p(bob.__proto__ === Person.prototype);  // true

// p(bob.hasOwnProperty('speak'));         // true
// p(fred.hasOwnProperty('speak'));        // true



//============================================================================//



// function Person() {}

// Person.prototype.speak = function () {
//   p('Hi');
// };

// let bob  = new Person();
// let fred = new Person();

// p(bob.speak === fred.speak);

// p(bob.speak     === Person.prototype.speak);  // true
// p(bob.__proto__ === Person.prototype);        // true

// p(bob.hasOwnProperty('speak'));               // false



//============================================================================//



// Array.prototype === Object.getPrototypeOf([]);  // true



//============================================================================//



// // When you call:
// let bob = new Person();

// // JS actually just does:
// let bob           = {};
// bob.[[Prototype]] = Person.prototype;
// Person.call(bob);

// // Then later, when you try to access a property:
// bob.speak;
// // it (recursively) checks whether `bob` has a property `speak`.
// // If not, it checks `Object.getPrototypeOf(bob).speak`.
// // And if that doesn't exist it checks
// // `Object.getPrototypeOf(Object.getPrototypeOf(bob)).speak`...
// // ...and so on:
// bob.speak
// || bob.__proto__.speak
// || bob.__proto__.__proto__.speak
// // ...
// || undefined;



//============================================================================//


// const foo = new Function();
// p(foo.name);
// p(foo);


//============================================================================//




// const foo = function () {};
// const qux = _ => 42;

// let obj = {
//   bar: function () {},
// };

// p(foo.name);      // "foo"
// p(qux.name)       // "qux"
// p(obj.bar.name);  // "bar"




//============================================================================//


function Person() {}

p(Person.__proto__ === Function.prototype);  // true
p(Person.__proto__ === Person.prototype);    // false
p(Person.prototype === Function.prototype);  // false

p(Person.__proto__);
p(Function.prototype);
p(Person.prototype);








//============================================================================//





//============================================================================//


// function Foo() {}

// Foo.prototype = {};

// let bar = new Foo();
// p(bar.constructor === Foo);     // false
// p(bar.constructor === Object);  // true

// Foo.prototype.constructor = Foo;




//============================================================================//



let foo = { a: 2 };
let bar = Object.create(foo);

foo.a; // 2
bar.a; // 2

foo.hasOwnProperty('a');   // true
bar.hasOwnProperty('a');   // false

bar.a++;

p(foo.a);
p(bar.a);
p(bar.hasOwnProperty('a'));
