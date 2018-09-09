/*
- function keyword spacing
- trailing commas
- comment spacing
- semicolons after function expressions ending brace

___

- #1:
  - "three own properties: a, b and c "
    - fix punctuation
    - the solution has *four* own properties, not three
  - is mutating shape intentional / good practice ...?
- #2:
  - add quotes to logged
  - maybe fix: "Recall that if it's called with the new operator that JavaScript sets the value of this behind the scenes. If it's used as a regular function (invoked without the new), invoke itself with the new operator and return the result. If it's used as a constructor function, run the rest of the code in the function."
- #4:
  - missing template example for function like the other problems have
  - "to create an object inherited from ~~it~~ [the calling object]:"
  - confusing term: "beget"
  - indentation spaces set to 4
*/
//============================================================================//
//======================== 1 =========================//


// let shape = {
//   type: '',
//   getType() {
//     return this.type;
//   },
// };

// const Triangle = function (a, b, c) {
//   Object.assign(this, { a, b, c });
//   return 42;
// };

// Triangle.prototype              = shape;
// Triangle.prototype.constructor  = Triangle;
// Triangle.prototype.type         = 'triangle';
// Triangle.prototype.getPerimeter = function () {
//   return this.a + this.b + this.c;
// };


// var tri = new Triangle(1, 2, 3);
// p(tri.constructor);                   // Triangle(a, b, c)
// p(shape.isPrototypeOf(tri));          // true
// p(tri.getPerimeter());                // 6
// p(tri.getType());                     // "triangle"

// p(shape);
// p(Object.getOwnPropertyNames(tri));




//¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
//………………………………………………………………………………………………………………………………………………………………………………………………………………
//◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦
//============================================================================//
//======================== 2 =========================//


// // const User = function (first, last) {
// //   return {
// //     name:      `${first} ${last}`,
// //     __proto__: User.prototype,
// //   };
// // };


// // const User = function (first, last) {
// //   let self = this === this instanceof User ? this : { __proto__: User.prototype };
// //   self.name = `${first} ${last}`;
// //   return self;
// // };


// const User = function (first, last) {
//   if (!(this instanceof User)) return new User(first, last);
//   this.name = `${first} ${last}`;
// };

// let user1 = new User('John', 'Doe');
// let user2 = User('John', 'Doe');

// p(user1.__proto__   === User.prototype);     // true
// p(user1.__proto__   === user2.__proto__);    // true
// p(user1.constructor === user2.constructor);  // true
// p(this.name         !== 'John Doe');         // true

// // let name  = 'Jane Doe';
// // p(name);        // Jane Doe
// // p(user1.name);  // John Doe
// // p(user2.name);  // John Doe


// // p(user1);
// // p(user2);



//============================================================================//
//======================== 3 =========================//


// const createObject = proto => ({
//   __proto__: proto,
// });

// const createObject = proto =>
//   Object.setPrototypeOf({}, proto);

// const createObject = proto => {
//   const F     = function () {};
//   F.prototype = proto;
//   return new F;
// };


// var foo = {
//   a: 1,
// };

// var bar = createObject(foo);
// p(foo.isPrototypeOf(bar));         // true
// p(bar.__proto__ === foo);
// p(Object.getPrototypeOf(bar));




//============================================================================//
//======================== 4 =========================//


// Object.prototype.begetObject = function () {
//   const F = function () {};
//   F.prototype = this;
//   return new F;
// };


// // Object.prototype.begetObject = function () {
// //   return Object.create(this);
// // };


// Object.prototype.begetObject = function () {
//   return Object.setPrototypeOf({}, this);
// };


// var foo = {
//   a: 1,
// };

// var bar = foo.begetObject();
// p(foo.isPrototypeOf(bar));         // true
// p(bar.__proto__ === foo);
// p(bar instanceof foo.constructor);



//============================================================================//
//======================== 5 =========================//



const neww = function (constructor, args) {
  return new constructor(...args);
};

const neww = function (constructor, args) {
  return Reflect.construct(constructor, args);
};

const neww = function (constructor, args) {
  const F = function () {
    return constructor.apply(this, args);
  };
  F.prototype = constructor.prototype;
  return new F;
};

const neww = function (constructor, args) {
  return new (
    Function.prototype.bind
    .apply(constructor, [null, ...args])
  );
};

const neww = function (constructor, args) {
  let obj = Object.create(constructor.prototype);
  let result = constructor.apply(obj, args);
  return result === undefined ? obj : result;
};

const Person = function (firstName, lastName) {
  this.firstName = firstName;
  this.lastName  = lastName;
};

Person.prototype.greeting = function () {
  p(`Hello, ${this.firstName} ${this.lastName}`);
};

let john = neww(Person, ['John', 'Doe']);
john.greeting();               // Hello, John Doe
p(john.constructor === Person);          // true
p(john.__proto__ === Person.prototype);  // true

const Foo = function () {
  return { a: 42 };
};

let foo = neww(Foo, []);
p(foo.__proto__ !== Foo.prototype);   // true
p(foo);                               // { a: 42 }


//=======================================//


// const neww = function (constructor, args) {
//   let obj    = Object.create(constructor.prototype);
//   let result = constructor.apply(obj, args);
//   return [obj, result || obj];
// }

// function Person(firstName, lastName) {
//   this.firstName = firstName;
//   this.lastName  = lastName;
//   return { greeting() { p(42) } };
// }


// var [john, bob] = neww(Person, ['John', 'Doe']);
// john.greeting();          // "Hello, John Doe"
// p(john.constructor);      // Person(firstName, lastName) {...}
// p(john);
// p();

// bob.greeting();          // "Hello, John Doe"
// p(bob.constructor);      // Person(firstName, lastName) {...}
// p(bob);
