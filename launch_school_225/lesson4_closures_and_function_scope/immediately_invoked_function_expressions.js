/*
IMPORTANT: Many of the following issues are more urgent than usual because the assignment contains some incorrect information.

___

- function keyword spacing

___

- "The extra parentheses around the function ~~declaration~~ [expression] "
- " The extra parentheses around the function declaration are important; without them, we can't invoke the function right away:":
  - emdash: "important; without them, "
  - the error is actually due to trying to declare an anonymous function: `function(` -- JS doesn't even get to the last line (although it would also raise a SyntaxError -- but this one seems to occur any time JS encounters an empty pair of parens `()`)
- "In JavaScript, surrounding a value with parenthesis doesn't change the value:":
  - should be plural: " surrounding a value with parenthesis"
  - it kind of does with functions because it changes it to an expression instead of a declaration
  - format like Chrome: "[ 'apple', 'carrot' ]"
- not a very good explanation: "With IIFEs, we use the parentheses to deal with a limitation of JavaScript's syntax, and let it interpret the function as an IIFE."
- JS already knows its not a declaration because its anonymous (in example code): ". As with the original style, they let JavaScript distinguish between an ordinary function declaration and an IIFE."
- ". JavaScript handles [them] the same as the original style."
- a function declaration is never a function expression -- they're two different things: "We can omit the parentheses around an IIFE when the function declaration is an expression that doesn't occur at the beginning of a line:"
*/
//============================================================================//

// (_ => p('hello'))();

// function asd() {
//   console.log('hello');
// }();


p((function (a) {
  return a + 1;
})(2));


(function () {
  p(42);
})();

(function () {
  p(42);
}());

let foo = function () {
  return function () {
    return 10;
  }();
}();

p(foo);    // 10

// equivalent to:
let bar = (_ => (_ => 10)())();
p(bar);    // 10
