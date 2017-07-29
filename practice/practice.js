
var name = 'Bob';
console.log(name);

for (var i = 0; i < 3; i++) {
  console.log(name);
}

console.log(name);
// Bob * 5
console.log('-------\n');


var name = 'Bob'

function greet() {
  console.log(name);
}

greet(); // logs 'Bob'

var name = 'Bob'

function greet() {
  function say() {
    console.log(name);
  }
  say();
}

greet(); // logs 'Bob'
