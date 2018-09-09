/*
- add commas or parens to "eg"s: "Function invocations, e.g., parseInt(numberString) rely upon implicit execution context that resolves to the global object. Method invocations, e.g., array.forEach(processElement) rely upon implicit context that resolves to the object that holds the method."
- should be 'declared': "You can't use delete to delete variables and functions ~~defined~~ at the global scope:"
- clarify what "their" refers to: "You can add them to objects and execute them in their contexts. "
- maybe emphasize that all JS functions are first-class, and add comma: "JavaScript has first-class functions [,] which have the following characteristics:"
- "bind permanently binds a Function to the context of an object.":
  - maybe lowercase 'function'
  - maybe add that `bind` creates a new function
- maybe change to 'invocation' definition instead of definition of a "method": "A function included in an object that can operate on data within that object is a method."
*/
//========================  =========================//
