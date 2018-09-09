/*
- trailing commas
- function keyword spacing
- comment spacing

___

- change word: "If you're ~~free~~ to update the receiving function"
*/
//========================  =========================//

function repeatThreeTimes(func, context) {
  func.call(context);       // can't do func.call(john), out of scope
  func.call(context);
  func.call(context);
}

function foo() {
  var john = {
    firstName: 'John',
    lastName: 'Doe',
    greetings: function() {
      console.log('hello, ' + this.firstName + ' ' + this.lastName);
    }
  };

  repeatThreeTimes(john.greetings, john); // Strips context
}

foo();



let obj = {
  a: 'A',
  logA() {
    p(this.a);
  },
}

function wrap(func) {
  func();
}

wrap(obj.logA);
wrap(obj.logA.bind(obj));
