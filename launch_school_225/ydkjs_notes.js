/*

*/
//============================================================================//


// function foo() {
//   const bar = _ => p(a);
//   let a = 42;
//   call(bar);
// }

// function call(fn) {
//   fn();
// }

// foo();  // 42



//============================================================================//


// function CoolModule() {
//   let something = 'cool';
//   let another   = [1, 2, 3];

//   function doSomething() {
//     p(something);
//   }

//   function doAnother() {
//     p(another.join(' '));
//   }

//   return {
//     doSomething: doSomething,
//     doAnother:   doAnother,
//   };
// }

// let foo = CoolModule();
// foo.doSomething();  // cool
// foo.doAnother();    // 1 2 3





//============================================================================//



// let foo = (function CoolModule() {
//   let something = 'cool';
//   let another   = [1, 2, 3];

//   function doSomething() {
//     p(something);
//   }

//   function doAnother() {
//     p(another.join(' '));
//   }

//   return {
//     doSomething: doSomething,
//     doAnother:   doAnother,
//   };
// })();

// foo.doSomething();  // cool
// foo.doAnother();    // 1 2 3





//============================================================================//



// function baz() {
//   // call-stack is: `baz`
//   // so, our call-site is in the global scope
//   p('baz');
//   bar(); // <-- call-site for `bar`
// }

// function bar() {
//   // call-stack is: `baz` --> `bar`
//   // so, our call-site is in `baz`
//   p('bar');
//   foo(); // <-- call-site for `foo`
// }

// function foo() {
//   // call-stack is: `baz` --> `bar` --> `foo`
//   // so, our call-site is in `bar`
//   p('foo');
// }

// baz(); // <-- call-site for `baz`



//============================================================================//




// function foo() {
//   p(this.a);
// }

// let obj = {
//   a: 2,
//   foo,
// };

// obj.foo();  // 2


//============================================================================//


// function foo() {
//   p(this.a);
// }

// function doFoo(fn) {
//   // `fn` is just another reference to `foo`
//   fn();          // <-- call-site!
// }

// var obj = {
//   a: 2,
//   foo,           // function reference/alias
// };

// var a = 'oops, global';
// doFoo(obj.foo);  // "oops, global"


//============================================================================//



// function foo() {
//   p(this.a);
// }

// var obj = {
//   a: 2,
//   foo,
// };

// function bind(fn, obj) {
//   return function (...args) {
//     return fn.apply(obj, args);
//   };
// }

// var a = 'oops, global';
// var boundFoo = bind(foo, obj);

// foo();       // "oops, global"
// boundFoo();  // 2





//============================================================================//


// function foo(something) {
//   this.a = something;
// }

// var obj1 = {};

// var bar = foo.bind(obj1);
// bar(2);
// p(obj1.a);    // 2

// var baz = new bar(3);
// p(obj1.a);    // 2
// p(baz.a);     // 3


//============================================================================//


// if (!Function.prototype.bind) {
//   Function.prototype.bind = function (oThis) {
//     if (typeof this !== 'function') {
//       // closest thing possible to the ES5 internal `IsCallable` function
//       throw new TypeError('Function.prototype.bind - what is trying to be bound is not callable');
//     }

//     var aArgs   = Array.prototype.slice.call(arguments, 1);
//     var fToBind = this;
//     var fNOP    = function () {};
//     var fBound  = function () {
//       return fToBind.apply(
//         (
//           this instanceof fNOP &&
//           oThis ? this : oThis
//         ),
//         aArgs.concat(Array.prototype.slice.call(arguments))
//       );
//     };

//     fNOP.prototype   = this.prototype;
//     fBound.prototype = new fNOP();

//     return fBound;
//   };
// }


// function foo(something) {
//   this.a = something;
// }

// var obj1 = {};

// var bar = foo.bind(obj1);
// bar(2);
// p(obj1.a);    // 2

// var baz = new bar(3);
// p(obj1.a);    // 2
// p(baz.a);     // 3


//============================================================================//


// function foo() {
//   p(this.a);
// }

// var a = 2;
// var b = { a: 3, foo };
// var c = { a: 4 };

// b.foo();                  // 3
// (c.foo = b.foo)();        // 2




//============================================================================//



// var Foo = {
//   bar: function(x) {
//     if (x < 10) {
//       return Foo.bar( x * 2 );
//     }
//     return x;
//   },
//   baz(x) {
//     if (x < 10) {
//       return baz( x * 2 );
//     }
//     return x;
//   }
// };

// p(Foo.bar(1));
// p(Foo.baz(1));
