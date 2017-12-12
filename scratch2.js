/*
- trailing commas
- function keyword spacing
- comment spacing
- double quoted strings

#1:
  - fix grammar/punctuation/phrasing of Hint: "You'll need to traverse up the prototype chain of the object and for each object, see if the property is defined, with the hasOwnProperty method. Object.prototype is at the top of the prototype chain, if you can't find the property there and keep using Object.getPrototypeOf to get its prototype, you'll get null and that's what you should return."
- #2:
  - semicolon after `bar.say`
  - tense: "The copied object should share the same prototype chain as the original object, and it has the same own properties that return the same values or objects when accessed. "
  - `var` at top (x2)
- #3:
  - newlines after methods
  - `Goodbye` capitalization inconsistent
  - `var` at top (x4)
  - `i++`
* - fix phrasing: "The extend function is JavaScript's way for the "Mixin" pattern. "
  - maybe fix phrasing in whole Solution


  // function foo() {};
  // let prot = foo.prototype;

  // p(Object.getOwnPropertyNames(prot));  // ["constructor"]
  // p(prot.constructor === foo);          // true
  // p(prot.constructor);                  // ƒ foo() {}


