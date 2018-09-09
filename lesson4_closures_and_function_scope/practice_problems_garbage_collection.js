/*
- function keyword spacing
- double quoted strings (in code and text)
- buttons for Solution just say "Solution" instead of "Show Solution" like in previous practice problem assignments
- add `...` after `// more code`

___

- #2: missing quotes: "the variable's reference to `A string` is broken "
- #4: semicolon after return statement
*/
//============================================================================//

const makeEvenCounter = _ => {
  let n = 0;
  return _ => n++;
};

const evenCounter = makeEvenCounter();

// is 0 eligible for GC here?

// ... more code ...
