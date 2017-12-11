/*
- function keyword spacing
- comment spacing

___

- maybe incorrect word, or needs apostrophe...?: "  at ***constructions*** functions "
- semicolon after `fullName` (x2)
- wrap "new" in backticks: " with the new operator; "
- capital sentences and periods in list
- #2:
  - "This code will throw a TypeError because scamper is an undefined property on lizzy and not a function.":
     - wrap in backticks: " s an ***undefined*** property "
     - this is actually because `lizzy` is `undefined`, and trying to access a property on `undefined` raises an error
         - the function returns `undefined` instead of an object because the `new` keyword was omitted
- #3: change "such that" to "so that"
*/
//============================================================================//

// function Person(firstName, lastName = '') {
//   this.firstName = firstName;
//   this.lastName  = lastName;
//   this.fullName  = function () {
//     return `${this.firstName} ${this.lastName}`.trim();
//   };
// };

// let john = new Person('John', 'Doe');
// let jane = new Person('Jane');

// p(john.fullName());
// p(jane.fullName());

// p(john.constructor);
// p(jane.constructor);

// p(john instanceof Person);
// p(jane instanceof Person);







//========================  =========================//

// function Person(firstName) {
//   this.firstName = firstName;
// };

// let bob = Person('Bob');

// p(bob);
// p(firstName);
// p(this.firstName);

//========================  =========================//



// function myFunction() {
//   let myObject = {
//     objProperty: "string",
//   };

//   myObject.objMethod = function () {
//       return myObject.objProperty;
//   };

//   return myObject.objMethod();
// };



//========================  =========================//

// // function invocation::
// alert('Hello World!');

// // method invocation:
// console.log('Hello World!');

// // constructor invocation:
// new RegExp('\\d');

// // indirect invocation:
// alert.call(undefined, 'Hello World!');

//========================  =========================//

// new myObject.myFunction();

// // first the function is extracted using a property accessor:
// extractedFunction = myObject.myFunction;

// // then it's invoked as a constructor to create a new object:
// new extractedFunction();

//========================  =========================//

// // equivalent:
// RegExp('abc');       // /abc/
// new RegExp('abc');   // /abc/

// //=====================//

// function Vehicle(type) {
//   this.type = type;
//   return this;
// }

// // not equivalent:
// let car   = Vehicle('Car', 4);
// let truck = new Vehicle('Truck', 4);

// car.type;            // "Car"
// car === window;      // true

// truck.type;          // "Truck"
// truck === window;    // false



// function Vehicle(type, wheelsCount) {
//   if (!(this instanceof Vehicle)) {
//     throw Error('Incorrect invocation');
//   }

//   this.type = type;
//   this.wheelsCount = wheelsCount;
//   return this;
// }

//========================  =========================//

function getThis() {
  return this;
}

let one = getThis.bind(1);
one();          // Number {[[PrimitiveValue]]: 1}
one.call(5);    // Number {[[PrimitiveValue]]: 1}
one.bind(5)();  // Number {[[PrimitiveValue]]: 1}
new one();      // => getThis {} -- an Object




//======================== 2 =========================//

// function Lizard() {
//   this.scamper = function() {
//     console.log("I'm scampering!");
//   };
// }

// var lizzy = Lizard();
// lizzy.scamper; // ?



//======================== 3 =========================//

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = new Lizard();
p(lizzy.scamper());
