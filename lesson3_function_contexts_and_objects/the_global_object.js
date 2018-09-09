/*
- comment spacing

___

- "In the previous course, we talked about ***global values*** "
  - no mention of this phrase in 210
- fix semicolon: "implicit evaluation context; the global object. "
- ", the first line doesn't define a global variable " and "On line 2, since there are no local or global variables named foo":
  - isn't `foo` a global variable itself, since it's a property of the global object...?
     - source: https://devdocs.io/javascript/statements/var
- "When we ***define*** global variables or functions, "
  - "declared" would be more accurate (for occurrences in the rest of this section as well)
- "Note" section might be better as info box
*/

// var foo = 1;
// function bar() {}

// p(window.foo)
// p(window.bar)


var foo = 1;
bar = 2;

p(delete foo);
p(delete bar);
p(delete aaaaaaa);

p(window.foo);
p(window.bar);


