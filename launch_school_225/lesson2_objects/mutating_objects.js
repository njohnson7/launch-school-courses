/*
- "Number", "String", "Boolean" should be lowercase
  - in text and in diagram
- "Objects", "Function" lowercase...?
  - "object" capitalization inconsistent
- change to emdash: " are immutable - you cannot "
- "You can replace them ~~by~~ [with] another value, but "
- "The flip side of this is that most JavaScript Objects are mutable - you can change them."
  - emdash
  - 'most' or all...?
  - italicize "can"
- "Let's first look at the case of a simple variable passed as an argument to a Function:"
  - "simple variable" is not very clear
- "a Function can't change the value of a variable that it received as an argument."
  - "value of a variable" is not very clear
- " variable b, [:] ~~namely~~ 1."

- first diagram:
  - "pass ~~along~~" (also in 2nd diagram)...?
  - "references the same value" or "[a copy of the same value]"...?
  - "`b` ~~did~~ [does]"

- "reassign thing (which ~~is the same as~~ counter) [references the same object as], but "
- rephrase colon "instead modifies a property of the Object: count,"
- semicolon --> emdash "doesn't create a new Object; thing and counter"
- "Variables don't hold values; they hold references to those values."
  - this is not accurate for variables with primitive values
  - also, for objects, don't variables hold a value that is a reference to the object's value (i.e., isn't a reference a type of value?)...?
- "When we pass counter to increment(), JavaScript places an identical reference in thing. "
  - maybe could be more clear -- ex: "JS sets `thing` to a copy of this reference"...?
- mix of passive/active voice: "Here, it finds the Object { count: 0 }, which then has its count property modified in place. "

- second diagram:
  - " the same Object [as] it did originally "...?
  - it is a primitive, not an object: " now points to a new ~~Number object~~"
  - " counter ~~also~~ still references "

- "In this assignment, we've ~~had a deeper view of~~ [looked more deeply at <OR> taken a closer look] how mutability in JavaScript works. "
- "Let's take this a step further and see what goes on behind the scenes when we ***assign primitive and reference values/types to variables*** by watching this video."
  - this is unclear and contradicts this assignment's earlier explanation that "Variables don't hold values"

- var declarations at top of scope
  - maybe not because then diagram would be inconsistent...?
  - some semicolons missing in console style code
*/

function change(a) {
  a = 2;
  console.log(a);
}

var b = 1;
change(b);          // logs 2
console.log(b);     // logs 1
p();

//========================  =========================//

const increment = thing => p(++thing.count);

let counter = { count: 0 };
p(counter);
increment(counter);
p(counter);
increment(counter);
increment(counter);
increment(counter);
p(counter);

//========================  =========================//

function increment(thing) {
  thing.count += 1;
  console.log(thing.count);
}


var counter = { count: 0 };
counter          // { count: 0 }
increment(counter);          // 1
counter          // { count: 1 }




//======================== //========================  =========================// =========================//
/*
code display improvmenets:

> input
logged
 => return

*/
