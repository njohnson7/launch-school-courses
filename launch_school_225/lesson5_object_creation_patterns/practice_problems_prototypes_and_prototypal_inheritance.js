/*
- trailing commas
- function keyword spacing
- comment spacing
- double quoted strings

___

- #1: fix grammar/punctuation/phrasing of Hint: "You'll need to traverse up the prototype chain of the object and for each object, see if the property is defined, with the hasOwnProperty method. Object.prototype is at the top of the prototype chain, if you can't find the property there and keep using Object.getPrototypeOf to get its prototype, you'll get null and that's what you should return."
- #2:
  - semicolon after `bar.say`
  - tense: "The copied object should share the same prototype chain as the original object, and it has the same own properties that return the same values or objects when accessed. "
  - `var` at top (x2)
- #3:
  - newlines after methods
  - `Goodbye` capitalization inconsistent
  - `var` at top (x4)
  - `i++`
  - fix phrasing: "The extend function is JavaScript's way for the "Mixin" pattern. "
  - maybe fix phrasing in whole Solution
*/
//============================================================================//
//======================== 1 =========================//


// // const getDefiningObject = function (object, propKey) {
// //   if (object.hasOwnProperty(propKey)) return object;
// //   let nextObject = object.__proto__;
// //   return nextObject ? getDefiningObject(nextObject, propKey) : null;
// // };


// // const getDefiningObject = function (obj, key) {
// //   return obj ? obj.hasOwnProperty(key) ? obj : getDefiningObject(obj.__proto__, key) : obj;
// // };


// const getDefiningObject = (obj, key) =>
//   obj && (obj.hasOwnProperty(key) && obj || getDefiningObject(obj.__proto__, key));


// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = Object.create(foo);
// let baz = Object.create(bar);
// let qux = Object.create(baz);

// bar.c = 3;

// pe(getDefiningObject(qux, 'a'), foo);
// pe(getDefiningObject(qux, 'b'), foo);
// pe(getDefiningObject(qux, 'c'), bar);
// pe(getDefiningObject(qux, 'e'), null);





//============================================================================//
//======================== 2 =========================//


// // const shallowCopy = obj => ({ __proto__: obj.__proto__, ...obj });


// // const shallowCopy = obj => {
// //   let copy = Object.create(obj.__proto__);
// //   for (let prop in obj) {
// //     if ({}.hasOwnProperty.call(obj, prop)) copy[prop] = obj[prop];
// //   }

// //   return copy;
// // };


// const shallowCopy = obj => {
//   let copy = Object.create(obj.__proto__);
//   Object.getOwnPropertyNames(obj).forEach(prop => copy[prop] = obj[prop]);
//   return copy;
// };



// let foo = {
//   a: 1,
//   b: 2,
//   hasOwnProperty: 3,
// };

// let bar = Object.create(foo);
// bar.c   = 3;
// bar.say = function () {
//   p(`c is ${this.c}`);
// };

// let baz = shallowCopy(bar);
// p(baz.a);                       // 1
// baz.say();                      // c is 3
// p(bar);
// p(baz);
// // p(baz.hasOwnProperty('c'));     // true
// // p(!baz.hasOwnProperty('a'));    // true
// p(baz.__proto__ === foo);       // true
// p();



//======================== aside =========================//

// let qux = {
//   a: 'A',
//   log42() {
//     p(42);
//   },
// };

// qux.log42();  // 42

// let copy = JSON.parse(JSON.stringify(qux));
// p(copy.a);
// copy.log42();

// p(qux);
// p(copy);

//======================== /aside =========================//

//======================== aside =========================//

// let obj1 = { hasOwnProperty: false };
// let obj2 = Object.create(null);

// obj1.foo = 42;
// obj2.foo = 42;

// p(obj1.hasOwnProperty('foo'));           // TypeError
// p(obj2.hasOwnProperty('foo'));           // TypeError

// p({}.hasOwnProperty.call(obj1, 'foo'));  // true
// p({}.hasOwnProperty.call(obj2, 'foo'));  // true

//======================== /aside =========================//







//============================================================================//
//======================== 3 =========================//


// function extend(target) {
//   [...arguments].slice(1).forEach(source => {
//     Object.getOwnPropertyNames(source).forEach(prop => target[prop] = source[prop]);
//   });

//   return target;
// }


// const extend = function (target) {
//   return [...arguments].reduce((target, source) => Object.assign(target, source));
// };


// const extend = (target, ...sources) => Object.assign(target, ...sources);


// const extend = Object.assign;


// let foo = {
//   a: 0,
//   b: {
//     x: 1,
//     y: 2,
//   },
// };

// let joe = {
//   name: 'Joe',
// };

// let funcs = {
//   sayHello() {
//     p(`Hello, ${this.name}`);
//   },

//   sayGoodbye() {
//     p(`Goodbye, ${this.name}`);
//   },
// };

// let object = extend({}, foo, joe, funcs);

// p(object.b.x);          // 1
// object.sayHello();      // Hello, Joe
// p(object);



//======================== A =========================//

// let foo = { a: 1 };
// let bar = Object.assign(foo, { b: 2 });

// p(foo);          // { a: 1, b: 2 } -- mutated
// p(foo === bar);  // true


// let qux = Object.create(foo);
// qux.c = 3;
// let cat = Object.assign({}, qux);

// p(qux.c === cat.c);                  // true
// p(qux.__proto__ === cat.__proto__);  // false

//======================== /A =========================//
