/*
- trailing commas
- function keyword spacing
- missing `var` before `obj =` (x3)



*/
//========================  =========================//

obj = {
  a: 'hello',
  b: 'world',
  foo: function() {
    function bar() {
      console.log(this.a + ' ' + this.b);
    }

    bar();
  }
};

obj.foo();        // undefined undefined