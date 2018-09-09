/*
- function keyword spacing (in Questions and Discussions)
- comment spacing

___

- #1: confusing phrase: " individually define " -- maybe change to 'enough to qualify as'
- #2:
  - Both choices B and D could technically be correct, depending on how you interpret them. They could also be interpreted as meaning the same thing. They should be clarified, and also maybe the question as well.
     - should be "defined" not "declared"
- #3 Discussion:
  - "It is possible; [you can] return an object with a method instead:"
  - there are also other ways, such as an IIFE
- #5:
  - choice A is confusing -- and isn't practice more important than theory (i.e., so why do we need to know how it works theoretically)...?: "Theoretically, any value referenced by a closure is not eligible for garbage collection while the closure exists."
  - this is incorrect (in practice), according to GC assignment and (especially) SO post: "As a result, any value referenced by a closure cannot be garbage collected. "
  - missing semicolon after return statement in Discussion
- #6:
  - missing semicolon (x2 -- in both Question and Discussion)
  - yes it does, according to standard definition, but not LS definition, which specifies that the "generator" function has to take a function as an argument -- see previous feedback for more information
  - typo: " wether "
- #7: missing semicolon in return statement (x2)
- #8:
  - missing semicolon in Discussion
  - function declarations can never be function expressions -- they're two different things: " if the function declaration is an expression "
*/
//============================================================================//

//======================== 6 =========================//

// const bar = (a, b) => a + b;

// function foo(a) {
//   return function (b) {
//     return bar(a, b);
//   };
// }

// const add5 = foo(5);
// p(add5(10));
// p(add5(20));


//======================== 7 =========================//

function sayForecast(day, conditions) {
  console.log('The weather ' + day + ' will be ' + conditions + '.');
}

function bar(day) {
  return function(weather) {
    sayForecast(day, weather);
  }
}

const sunday = bar('Sunday');
sunday('cloudy');


/*

IMPORTANT

___

Either Choice C needs to be considered correct, or the course content regarding garbage collection needs to be edited.

According to Problem #1 in [Practice Problems: Garbage Collection](https://launchschool.com/lessons/0b371359/assignments/d5156138): "JavaScript is a garbage-collected language. This means that the JS runtime, rather than the developer, handles ***memory allocation*** and deallocation." Therefore, according to this definition, Choice C ("Garbage collection in JavaScript is responsible for memory allocation and deallocation") is correct.

The [Garbage Collection](https://launchschool.com/lessons/0b371359/assignments/48d2a179) assignment also implies that Choice C is correct: "Programming languages that don't have garbage collection, GC for short, make the developer write code to ***allocate (claim) memory*** for data, and to deallocate (unclaim or release) memory when it no longer needs the data." This implies that GC is responsible for memory allocation, since without GC the developer would have to allocate memory.

From the same assignment: "Suppose we have a fictional version of JavaScript that doesn't use GC. Programs written in this fictional JavaScript make the developer manage ***memory allocation*** and deallocation for every object or primitive value." This also implies that Choice C is correct.

Furthermore, this sentence from the same assignment implies that Choice C is correct as well: "Of course, JavaScript has GC, so this intricate dance of claim/test/copy/use/release isn't necessary."

Nowhere in the "Garbage Collection" assignment does it say that the garbage collector isn't responsible for memory allocation. The comments in the code snippets say "The JavaScript runtime automatically allocates the memory", but not which part of the "JavaScript runtime" is reponsible for allocating the memory -- it could be the garbage collector from the information given.

Also, the linked-to [Memory Management](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_Management) page on MDN says: "High-level languages embed a piece of software called "garbage collector" whose job is to track ***memory allocation*** and use". This gives an impression that the "garbage collector" software may be responsible for memory allocation, since its job is to "track memory allocation and use".


//========================  =========================//

IMPORTANT

___

Question #6 is very misleading and confusing for a number of reasons.

Here is the closest thing to a definition of "partial function application" given in the [Partial Function Application](https://launchschool.com/lessons/0b371359/assignments/f2c6f687) assignment:

> Partial function application uses a function (we'll call it the generator) that creates a new function (the applicator) to call a third (the primary) that ***the generator receives as an argument***. The generator receives some of the primary's arguments, while the applicator receives the rest when it gets invoked. The applicator then calls the primary and passes it all its arguments, both those passed to the generator and the applicator.

According to this definition, the answer should technically be "No" (Choice B) because `foo` does not take a function as an argument. Whether `bar` makes use of the arguments doesn't make a difference if you go by this strict/literal definition.

Also, nowhere in this definition does it say that it is a requirement that the arguments are used by the inner function. It only says that the outer function calls the inner function and passes arguments to it, which is the case in the example code in Question 6. Interpreting the definition in this way, Choice A ("Yes") should be correct.

In further support of Choice A ("Yes") being correct, the [Practice Problems: Closures](https://launchschool.com/lessons/0b371359/assignments/5271e93c) assignment says:

> ```js
function later(func, argument) {
  return function() {
    func(argument);
  }
}
```

> We call this partial application: the original function already has some of its arguments defined. In effect, the program partially applies them ahead of time. Since you already have their values, you don't need to provide them when you invoke the function.

> Here, `later` partially applies functions that take a single argument. ***You can use partial application with functions that take any number of arguments***; you can provide any arguments ahead of time, and the others when you invoke the returned function.

The example code given in this assignment is almost exactly the same as the code in Question 6.

"You can use partial application with functions that take any number of arguments" implies that even functions that have no defined parameters (and therefore don't "make use of both arguments in play") can still be used with partial application.

Also, Problem #3 in the [Practice Problems: Partial Function Application](https://launchschool.com/lessons/0b371359/assignments/4cb22406) assignment has the following function:

> ```js
function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b);
  }
}
```

The name of this function, `makePartialFunc`, implies that a partial function will always be returned, no matter what type of function is passed (i.e., even if the `func` argument doesn't "make use of both arguments in play").

Nowhere in any of the course content so far is there a definition of "partial function application" like the one in the Discussion of Question #6:

> Partial function application occurs if an outer function (foo) returns a new function that invokes an inner function (bar) that ***makes use of both of the arguments in play*** (a and b).

I looked throughout the whole course before answering this question, and was unable to find the information I needed to be able to answer it correctly. Going by the course content alone, any of the three answers could technically be considered valid. For a tricky question such as this, there should be a clear definition of "partial function application" in the course -- otherwise, it's just very misleading and confusing, and not very helpful.
*/
