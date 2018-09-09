/*
- double quoted strings
- comment spacing
- trailing commas
- function keyword spacing

- #5:
  - should be opposite order: "bar's assignment to foo "
  - rephrase: "baz's assignment to an identical object literal has replaced foo and bar's reference to undefined, since it is the same, but the comparison of undefined to undefined returns true."
- #6 is not really covered in the lesson
- #8: Discussion doesn't apply to any of the choices
- #9: newline and semicolon after `speak`
*/




//======================== 6 =========================//

// var name1 = 'name1';
// let name2 = 'name2';
// const name3 = 'name3';
// name4 = 'name4';

// let obj = {
//   name1,
//   name2,
//   name3,
//   name4,
//   sayName() {
//     p(this.name1);
//     p(this.name2);
//     p(this.name3);
//     p(this.name4);
//     p(this);
//   },
// };

// name1 = 'new name1';
// name2 = 'new name2';
// var foo = obj.sayName;
// let bar = obj.sayName;
// const qux = obj.sayName;
// yii = obj.sayName;

// let x = {};
// x.y = obj.sayName;


// obj.sayName();
// p();
// foo();
// p();
// bar();
// p();
// qux();
// p();
// yii();
// p();
// x.y();
// p();

// p(obj.sayName)
// p(foo)

//======================== 7 =========================//

// var foo = {};
// var bar = foo;  // foo

// var a = 10;
// var b = a;      // 10

// foo.a = a;      // 10
// foo.b = foo.a;  // 10

// a += 10;        // a     === 20
// foo.a += 10;    // foo.a === 20

// b === a;         // false --> 10 === 20
// foo.a === bar.a; // true -->  20 === 20
// p(foo);
// p(bar);
// p(bar === foo);



//======================== 9 =========================//

let i = 0;

function makeRobot() {
  var robot = {};
  p(i);
  i++;
  robot.speak = function() {
    console.log("Danger, Will Robinson!" + i);
  }
  return robot;
}

var rob = makeRobot();
var fred = makeRobot();
rob.speak();
fred.speak();
p(rob);

p(rob === fred);
p(rob.speak)
p(fred.speak)
p(rob.speak === fred.speak);


