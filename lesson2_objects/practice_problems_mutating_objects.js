/*

- double quoted strings
- trailing commas in objects
- comment spacing
- "object" is always lowercase here, making it inconsistent with previous assignments
- all the solutions would benefit from being rephrased to make them more clear

- #1, #2:
  - "1. What will the code below output to the ~~terminal~~ [console]?"
  - #1 doesn't actually pass `message` to `func`
  - "Thus, reassigning ~~myObj's~~ [the object's (maybe more clear...?)] property message inside [the] function scope doesn't break myObj's connection to the object itself."
  - "As a result, ~~`myObj.messages`'s~~ [`myObj.message`'s] reassignment in the function scope is reflected in [the] global scope as well."
  - possible improvements:
    - #2 says " in contrast to the immutabiity of primitives, which was demonstrated in problem one", but I think #1 demonstrates variable scope and shadowing more than the immutability of primitives. If it reassigned an object argument instead of a string argument, the result would be the same. #2 reassigns the same variable (property), but #1 reassigns a different variable -- if #1 reassigned the same (global) variable (ie, no shadowing), the result would also be the same (ie, "the reassignment would be reflected in both scopes"), such as `this.message = '...'`

- #3:
  - rephrase Solution to make it more clear
  - ", and no new variable is ~~instantiated~~ [incorrect term...?] in the ~~method~~ [function] scope."
  - fix phrasing: " same-named global-scope variable."

- #4:
  - "Primitive values are immutable, and newObj.a += 10 breaks the property a's original ~~reference~~ [correct term...?] to the primitive value 10 and reassigns ~~it to a new value.~~ [a new value to it]" -- maybe rephrase whole sentence to make more clear.
  - "Since objects are mutable, however, newObj, ***which references obj*** [doesn't it reference the actual obj, not another variable -- and according to video from last assignment, it creates a copy of the reference, so there are two references in total], can be altered without breaking the reference to the object in memory. " -- maybe rephrase whole sentence
  - maybe rephrase whole Solution to make it more clear

- #5:
  - "animal", "true", "false" should be in backticks
  - maybe change "second to last line" and "last line" to "line 17" and "18"
  - "the second to last line outputs false, and the last line outputs true."
     - neither line "outputs" anything



*/


//======================== 1 =========================//

var message = "Hello from the global scope!";

function func(message) {
  p(this.message);
  p(message);
  this.message = "Hello from the function scope!";
  console.log(message);
}

func();
console.log(message);


//======================== ... =========================//

//======================== 5 =========================//

let foo = {};
let bar = { a: foo };
foo = {};
p(bar.b === foo);
