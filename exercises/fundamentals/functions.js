/*----------------- 1 --------------------*/console.log('-------- 1 ---------');
//======= Local vs Global =======//

// var myVar = 'This is global';

// function someFunction() {
//   var myVar = 'This is local';
// }

// someFunction();

// console.log(myVar);


// this will log 'global' because myVar resolves to the global variable.
// a new local variable is declared in the function, shadowing the global variable from w/i the function, but as soon as the funtion returns, that variable is no longer accessible.








/*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
//======= Shadowing =======//

// var myVar = 'This is global';

// function someFunction() {
//   var myVar = 'This is local';
//   console.log(myVar);
// }

// someFunction();


// 'This is local' will be logged.

// when someFunction is called, we declare a new variable called myVar in the local scope of the function, and initialize it to 'This is local'. This local variable shadows the myVar variable with the same name in the outer (global) scope, so whenever myVar is referenced from w/i the function, JS only sees the local myVar, and has no way to access the global one.
// JS resolves variables using Lexical Scoping rules, meaning that the source code determines the scope of variables. When a variable is referenced or assigned, JS will look for a variable with a matching name starting from the current scope, and then moving up to each outer scope in the hierarchy of scopes. When it finds one, it will stop looking and return that one. So when we log myVar in the function, JS looks for myVar starting in the local inner scope of the function and finds it, then stops looking and so myVar resolves to the local myVar, which gets logged to the console. JS never even sees the global myVar, since it stopped looking when the local one was found.

// Normally vars in the global scope are accessible from anywhere in the program, but in this case the local var has priority b/c of shadowing.






/*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
//======= Accessing Global =======//

// var myVar = 'This is global';

// function someFunction() {
//   myVar = 'This is local';
// }

// someFunction();

// console.log(myVar); // 'This is local'



// When a variable in a function is assigned, but is not declared and is not a param, JS uses the same lexical scoping rules to find it as it does for variable reference. So here it will look for myVar in the function's local scope, not find it, then look up in the next scope, which is the global scope in this case. It finds myVar, and so myVar in this assignment expression resolves to the global myVar, which is reassigned to 'this is local'.

// myVar will log its new reassigned value.

// JS vars at the global scope can be accessed and changed inside an inner scope.







/*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
//======= Variable Lookup =======//

// var myVar = 'This is global';

// function someFunction() {
//   console.log(myVar);
// }

// someFunction(); // 'This is global'



// global vars are accessible from inner scopes








/*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
//======= Accidentally Global =======//

// // no code above
// function someFunction() {
//   myVar = 'This is global';
// }
// someFunction();
// console.log(myVar); // 'this is global'



// when a variable is assigned w/o being declared anywhere first, JS will initialize a new global variable, even if that variable is assigned from w/i a function.







/*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
//======= Pass by Value =======//

// var a = 7;

// function myValue(b) {
//   b += 10;              // params initialize a new local variable
// }
// myValue(a);
// console.log(a);          // 7



// when we pass in the global var a to the function, the function initializes a new local variable b, and assigns it a value of 7. Because numbers are primitives and immutable, and because a and b are two different variables, this function has no effect on a.








/*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
//======= Pass by Value with Shadowing =======//

// var a = 7;

// function myValue(a) {
//   a += 10;
// }

// myValue(a);
// console.log(a); // 7



// this logs 7 b/c even though the function local var a has the same name as the global a, and is passed in as an argument, the param a creates a new local var a upon function invocation. therefore the global a is not affected by this reassignment.




/*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
//======= Passing Objects =======//

// var a = [1, 2, 3];

// function myValue(b) {
//   b[2] += 7;
// }
// myValue(a);
// console.log(a); // [1, 2, 10]



// objects are passed by reference, so when a is passed to the function, a new local var called b is created, which binds to the same array that a is pointing to. So any actions that mutate b, such as element assignment, will also mutate a at the same time.





/*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
//======= Hoisting Variables =======//

// console.log(a); // undefined

// var a = 1;



// The var declaration is hoisted to the top of the global scope, but the assignment is left in place, so undefined will be logged, as a hasn't been assigned a value yet.






/*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
//======= Hoisting Functions =======//

logValue(); // hello world

function logValue() {
  console.log('Hello, world!');
}


// the function is hoisted to the top of the scope, including both the declaration and the body, so when it is called it will execute successfully.


// FE:

var x = 'var';

function x() {
  'function'
}
console.log(x);
console.log(x());
