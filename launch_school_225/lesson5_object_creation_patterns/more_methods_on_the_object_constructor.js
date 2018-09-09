/*
- maybe remove parens from method names
- function keyword spacing
- semicolons after function expressions
- log and console.log inconsistent backticks
- trailing commas
- double quotes in strings
- use more contractions (e.g., "that is") to be consistent with rest of course
- double quotes when using apostrophes
- newlines after method defs
- quote logged strings

___

- Object.create() and Object.getPrototypeOf() were already covered
- fix: " ability to be respond to "
- `typeof` not necessary: `console.log(typeof oldArr.first);      // undefined`
- fix " that returns us "
- fix "In a normal constructor, this is not possible, however using the defineProperties method on Object we can provide properties and values and set whether each property can be changed or not. "
- backticks: "name property"
- fix `me.log = function() { console.log("Amanda Rose"); };`
- fix: `console.log('I\'m frozen');`
- lowercase `'String'`
- rewrite: "For property values that are objects, the references to the objects are frozen, so you can't point to other objects, but you can still use the frozen references to mutate the objects."
- fix " can not "
*/
//============================================================================//



// function NewArray() {}
// NewArray.prototype = Object.create(Array.prototype);

// NewArray.prototype.first = function () {
//   return this[0];
// };

// let newArr = new NewArray;
// let oldArr = new Array;
// newArr.push(5, 2);
// oldArr.push(5, 2);

// p(newArr);
// p(oldArr);

// p(newArr.first());
// p(oldArr.first);
// p();




//============================================================================//


// let obj = {
//   name: 'obj',
// };

// Object.defineProperties(obj, {
//   age: {
//     value: 30,
//     writable: false,
//   },
// });

// p(obj.age);
// obj.age = 32;
// p(obj.age);




//============================================================================//
//======================== 1 =========================//


// function newPerson(name) {
//   return Object.defineProperties({ name }, {
//     log: {
//       value: function () {
//         p(this.name);
//       },

//       writable: false,
//     },
//   });
// }

// var me = newPerson('Shane Riley');
// me.log();     // Shane Riley

// me.log = function () {
//   console.log('Amanda Rose');
// };

// me.log();     // Shane Riley


//============================================================================//
//======================== 2 =========================//


let frozen = {
  integer: 4,
  string: 'String',
  array: [1, 2, 3],
};

Object.freeze(frozen);

frozen.integer = 8;
frozen.array.pop();

p(frozen);
