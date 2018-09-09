/*
- trailing commas
- function keyword spacing
- missing `var` before `obj =` (x3)

___

- solution 1: add newline after `bar` declaration
- solution 3: ", not a function declaration; a simple function ~~definition~~ [declaration...?] won't work."
*/
//========================  =========================//

// let obj = {
//   foo() {
//     function bar() {
//       p('inner', this);
//     }

//     p('outer', this);
//     bar();

//     const baz = _ => p(this);

//     baz();
//   },
// };

// obj.foo();


//========================  =========================//


// let obj = {
//   foo() {
//     let self = this;

//     function bar() {
//       p(this);  // Window
//       p(self);  // obj
//     }

//     bar();
//   },
// };

// obj.foo();


//========================  =========================//


let obj = {
  foo() {
    function bar() {
      p(this);  // obj
    }

    bar.call(this);
  },
};

obj.foo();


//========================  =========================//


let obj = {
  foo() {
    var bar = function () {
      p(this);    // obj
    }.bind(this);

    bar();
  },
};

obj.foo();



//========================  =========================//


let obj = {
  foo() {
    const bar = _ => p(this);
    bar();  // obj
  },
};

obj.foo();
