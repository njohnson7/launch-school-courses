/*
- function keyword spacing
- trailing commas
- `var`s at top
- newlines after function expressions
- comment spacing

___

- #1:
  - maybe change to 'method': "calls the bar function"
  - wrap numbers in backticks
  - fix: "object context which changes the global object's a to 2, and logged out the next 2. "
  - fix: "Finally, since the global object's a property is already changed to 2, the last 2 is logged out."
- #2:
  - fix: "this in RECTANGLE.area and RECTANGLE.circumference functions is set to the RECTANGLE object when they are called. Since RECTANGLE does not define width and height properties, both functions return NaN."
  - highlight changed lines
  - comment logged values in solution
- #3:
  - add quotes to log comments
  - fix: "Write a constructor function Circle that takes a radius argument that can create circle objects. You should be able to call an area on the created objects to get a circle's area. "
  - semicolon after `area`
- #4:
  - space in `(){` (x2, also #5, #6, #7) [MAYBE SEARCH TEXT OF WHOLE COURSE]
  - semicolon after swingSword
- #5:
  - semicolon after prototype
  - fix: "In this case, we didn't add a new method to the constructor function's prototype object, but rather made it point to a different object. The ninja object, meanwhile, still inherited from the original object, therefore it couldn't find a swingSword method anywhere on its prototype chain."
- #6:
  - fix: `// Add a swing method to the Ninja prototype which // returns itself and modifies swung`
  - semicolons after logs and after `swing`
  - fix: ` // this needs to be true`
- #7:
  - fix: "In this problem, we'll ask you to create a new instance of an object, without having direct access to the constructor function:"
  - semicolon after log
  - fix whole code snippet for style
  - maybe add another test as a requirement, such as: `ninjaA.__proto__ === ninjaB.__proto__;`
  - show logged values in solutions comments
*/
//============================================================================//
//======================== 1 =========================//


// var a = 1;

// function Foo() {
//   this.a   = 2;
//   this.bar = function () {
//     console.log(this.a);
//   };
//   this.bar();
// }

// var foo = new Foo(); // returns { a: 2, bar() } -- logs 2

// foo.bar();           // logs 2
// Foo();               // sets window.a = 2, window.bar -- logs 2

// var obj = {};
// Foo.call(obj);       // sets obj.a = 2, obj.bar -- logs 2
// obj.bar();           // logs 2

// console.log(this.a); // logs 2




//============================================================================//
//======================== 2 =========================//


// var RECTANGLE = {
//   area: function () {
//     return this.width * this.height;
//   },

//   circumference: function () {
//     return 2 * (this.width + this.height);
//   },
// };

// function Rectangle(width, height) {
//   this.width         = width;
//   this.height        = height;
//   this.area          = RECTANGLE.area.call(this);
//   this.circumference = RECTANGLE.circumference.call(this);
// }

// var rect1 = new Rectangle(2, 3);   // { width: 2, height: 3, area: NaN, circ: NaN }
// console.log(rect1.area);           // NaN
// console.log(rect1.circumference);  // NaN






//============================================================================//
//======================== 3 =========================//


// const Circle = function (radius) {
//   this.radius = radius;
// };

// Circle.prototype.area = function () {
//   return Math.PI * this.radius**2;
// };

// var a = new Circle(3);
// var b = new Circle(4);

// console.log(a.area().toFixed(2));  // "28.27"
// console.log(b.area().toFixed(2));  // "50.27"



//============================================================================//
//======================== 4 =========================//


// function Ninja() {
//   this.swung = true;
// }

// var ninja = new Ninja();

// Ninja.prototype.swingSword = function () {
//   return this.swung;
// };

// console.log(ninja.swingSword());

// p(ninja.__proto__);
// p(Ninja.prototype);
// p(Ninja.prototype === ninja.__proto__);





//============================================================================//
//======================== 5 =========================//


// function Ninja() {
//   this.swung = true;
// }

// let ninja = new Ninja();

// Ninja.prototype = {
//   swingSword() {
//     return this.swung;
//   }
// };

// p(ninja.__proto__ === Ninja.prototype);   // false
// p(ninja.__proto__);      // { constructor: ƒ }
// p(Ninja.prototype);      // { swingSword:  ƒ }

// let ninja2 = new Ninja;
// p(ninja2.swingSword());                   // true
// p(ninja2.__proto__ === Ninja.prototype);  // true

// p(ninja.constructor);    // ƒ Ninja()
// p(ninja2.constructor);   // ƒ Object()


// // p();

// // // p(ninja.swingSword());

// // let ninja2 = new Ninja();
// // p(ninja2.swingSword());
// // p();

// // p(ninja)
// // p(ninja2)
// // p(ninja.constructor)
// // p(ninja2.constructor)//////
// // p();

// // p(ninja.__proto__)
// // p(ninja2.__proto__)
// // p(Ninja.prototype)



//============================================================================//
//======================== 6 =========================//


// function Ninja() {
//   this.swung = false;
// }

// var ninjaA = new Ninja();
// var ninjaB = new Ninja();

// // Add a swing method to the Ninja prototype which
// // returns itself and modifies swung

// Ninja.prototype.swing = function () {
//   this.swung = true;
//   return this;
// };

// p(ninjaA.swing().swung);      // this needs to be true
// p(ninjaB.swing().swung);      // this needs to be true

// ninja.swing().swung;  // true



//============================================================================//
//======================== 7 =========================//


// var ninjaA = (function () {
//   function Ninja() {};
//   return new Ninja();
// })();

// // create a ninjaB object

// const Ninja = function () {};
// Ninja.prototype.constructor = ninjaA.constructor;
// let ninjaB = new Ninja;

// console.log(ninjaB.constructor === ninjaA.constructor);    // this should be true

// p(ninjaA);
// p(ninjaB);


//==================================//


// given:
let ninjaA = (function () {
  function Ninja() {
    this.name = 'Bob';
  }

  Ninja.prototype.fight = function () {
    return 'fights';
  };

  return new Ninja();
})();

// 5 ways (with different outcomes):
const Ninja = function () {};
Ninja.prototype.constructor = ninjaA.constructor;
let ninja2 = new Ninja;
p(ninjaA.constructor === ninja2.constructor);  // true
p(ninjaA.__proto__   === ninja2.__proto__);    // false
p(ninjaA.name        === ninja2.name);         // false
p(ninja2.hasOwnProperty('name'));              // false
p(typeof ninja2.fight === 'function');         // false
p(ninjaA);
p(ninja2);

let ninja3 = Object.create(ninjaA.__proto__);
p(ninjaA.constructor === ninja3.constructor);  // true
p(ninjaA.__proto__   === ninja3.__proto__);    // true
p(ninjaA.name        === ninja3.name);         // false
p(ninja3.hasOwnProperty('name'));              // false
p(typeof ninja3.fight === 'function');         // true
p(ninjaA);
p(ninja3);

let ninja4 = Object.create(ninjaA);
p(ninjaA.constructor === ninja4.constructor);  // true
p(ninjaA.__proto__   === ninja4.__proto__);    // false
p(ninjaA.name        === ninja4.name);         // true
p(ninja4.hasOwnProperty('name'));              // false
p(typeof ninja4.fight === 'function');         // true
p(ninjaA);
p(ninja4);

let ninja5 = {};
ninja5.constructor = ninjaA.constructor;
p(ninjaA.constructor === ninja5.constructor);  // true
p(ninjaA.__proto__   === ninja5.__proto__);    // false
p(ninjaA.name        === ninja5.name);         // false
p(ninja5.hasOwnProperty('name'));              // false
p(typeof ninja5.fight === 'function');         // false
p(ninjaA);
p(ninja5);

let ninja6 = new ninjaA.constructor();
p(ninjaA.constructor === ninja6.constructor);  // true
p(ninjaA.__proto__   === ninja6.__proto__);    // true
p(ninjaA.name        === ninja6.name);         // true
p(ninja6.hasOwnProperty('name'));              // true
p(typeof ninja6.fight === 'function');         // true
p(ninjaA);
p(ninja6);


//================================//


// p(ninjaB.constructor === ninjaA.constructor);    // this should be true
// p(ninjaA);
// p(ninjaB);

// p(ninjaA.__proto__ === ninjaB.__proto__);
// p(ninjaA.__proto__);
// p(ninjaB.__proto__);



// ninjaA.constructor.prototype === ninjaA.__proto__;


// let ninjaB = new ninjaA.constructor();
// let ninjaB = new ninjaA.constructor();
