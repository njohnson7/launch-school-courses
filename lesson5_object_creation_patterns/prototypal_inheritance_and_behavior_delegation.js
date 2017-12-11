/*
- function keyword spacing
- trailing commas
- comment spacing
- quote logged strings...? (check rest of course and 210 to make consistent either way)

___

- rephrase (to clarify and fix inconsistent tense and punctuation): "On line 10, JavaScript searches the baz object first, couldn't find the a property, then it searches the bar object, and finally the foo object and was able to find the property there. For baz.c, since the property is not defined anywhere on baz's prototype chain, the result of undefined is returned."
- missing `;`: `bar.name = 'world'`
- "In this case [,] the hello method is found on [the] bar object's prototype object, then called with [the/a] context of [the] bar object itself."
- "but instead of defining the say and run functions [methods]"
- period after "etc"
- emdash: "an object - that expression "
- "The hasOwnProperty method on an object ~~can~~ test[s] "
- fix grammar/phrasing: "The Object.getOwnPropertyNames method ~~can return you~~ an array of an object's own property names "
- add periods to end of both of the above sentences
- fix grammar/phrasing: "Here are 3 most useful ones:"
- fix grammar/phrasing: "You can see more about it here"
- #1: "What will the code below log to [the] console?"
- #3: use dot notation (unless for instructional purposes...?)
*/
//============================================================================//

// let foo = { a: 1, b: 2 };
// let bar = Object.create(foo);
// let qux = Object.create(bar);

// p(bar.a);
// p(qux.a);
// p(qux.c);


//========================  =========================//


// let foo = { a: 1, b: 2 };
// let bar = Object.create(foo);
// let qux = Object.create(bar);

// p(qux.a);   // 1
// p(qux.c);   // undefined

// bar.a = 3;

// p(qux.a);   // 3





//============================================================================//


// let foo = {
//   hello() {
//     return `hello ${this.name}`;
//   },
// };

// let bar  = Object.create(foo);
// bar.name = 'world';

// p(bar.hello());      // "hello world"
// p();




//============================================================================//


// let dog = {
//   say() {
//     p(`${this.name} says Woof!`);
//   },
//   run() {
//     p(`${this.name} runs away.`);
//   },
// };

// let fido  = Object.create(dog);
// fido.name = 'Fido';
// fido.say();
// fido.run();

// let spot  = Object.create(dog);
// spot.name = 'Spot';
// spot.say();
// spot.run();




//============================================================================//


// let dog = {
//   say() {
//     p(`${this.name} says Woof!`);
//   },
// };

// let fido  = Object.create(dog);
// fido.name = 'Fido';
// fido.say = function() {
//   p(`${this.name} is silent.....`);
// };

// fido.say();    // "Fido is silent....."

// let spot  = Object.create(dog);
// spot.name = 'Spot';

// spot.say();    // "Spot says Woof!"



//============================================================================//


// let foo = { a: 1 };

// let bar = Object.create(foo);
// bar.a = 1;
// bar.b = 2;
// p(Object.getOwnPropertyNames(bar));  // ["a", "b"]

// delete bar.a;
// p(Object.getOwnPropertyNames(bar));  // ["a"]



// // p(bar.hasOwnProperty('a'));  // false




//============================================================================//


// // returns a string representation of the object:
// Object.prototype.toString()

// // tests if the object is in another object's prototype chain:
// Object.prototype.isPrototypeOf(obj)

// // tests whether the property is defined on the object itself:
// Object.prototype.hasOwnProperty(prop)





//============================================================================//

//======================== PROBLEMS =========================//

//======================== 3 =========================//

var boo       = {};
boo['myProp'] = 1;

var far = Object.create(boo);

// lots of code

far['myProp']; // 1

p(Object.getOwnPropertyNames(far));
p(far.hasOwnProperty('myProp'));

far['myProp'] = 1;

p(Object.getOwnPropertyNames(far));
p(far.hasOwnProperty('myProp'));
