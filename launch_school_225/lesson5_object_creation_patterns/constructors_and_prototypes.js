/*
- function keyword spacing
- comment spacing

___

- remove semicolon: `function foo() {};`
- typo in both diagrams: "Foo.protopye"
- capital: "Foo function "
- punctuation: "This is because in JavaScript every function is a Function object created from the Function Constructor and as such also has a prototype (Function.prototype). "
- " Note that the prototype of a Function Object (i.e Foo and Qux) can not be modified as compared to the objects constructed (i.e bar and baz) from it.":
  - fix punctuation, phrasing, clarity
  - incorrect information -- for example, this works: `Foo.__proto__.wtf = 42`
- code snippet after second diagram:
  - period at end of first comment
  - wrong order of what happens in first function:
    - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain
*/
//============================================================================//


// function foo() {}

// p(Object.getOwnPropertyNames(foo.prototype));        // ["constructor"]
// p(foo.prototype.constructor === foo);                // true
// p(foo.prototype.constructor.prototype.constructor);  // ƒ foo() {}



//============================================================================//


// function Foo() {}

// let bar = new Foo();

// p(bar.constructor === Foo);
// p(bar.__proto__   === Foo.prototype);

// p(bar.constructor);
// p(bar.__proto__.constructor);
// p(Foo.prototype);
// p(Foo.prototype.constructor);



//============================================================================//


// const Foo = function () {};
// const Qux = function () {};

// p(Foo.__proto__ === Foo.prototype);               // false
// p(Object.getPrototypeOf(Foo) === Foo.prototype);  // false

// p(Qux.__proto__ === Qux.prototype);               // false
// p(Object.getPrototypeOf(Qux) === Foo.prototype);  // false

// let bar = new Foo();
// p(Object.getPrototypeOf(bar) === Foo.prototype);  // true

// let baz = new Qux();
// p(Object.getPrototypeOf(baz) === Qux.prototype);  // true

// p(Foo.__proto__ === Function.prototype);          // true
// p(Foo.constructor === Function);

// const cat = _ => 1;
// p(cat.constructor === Function);
// p();



//============================================================================//




// p((_ => 1).constructor);  // f Function


//============================================================================//




const Cat = function () {};

Cat.prototype.say = _ => p('nyan');

let cat = new Cat();
cat.say();
