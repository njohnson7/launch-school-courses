console.log(typeof 1.2);      // 'number'
console.log(typeof 'hello');  // 'string'
console.log(typeof false);    // 'boolean'

console.log(0.1 + 0.2);  // 0.30000000000000004

console.log(2 > 1);
console.log(0 === 0);
console.log(1 > 3);

console.log(2 / 0);
console.log(Math.sqrt(-1));

2 / 0;          // Infinity
Math.sqrt(-1);  // NaN

2 > 1;    // true
0 === 0;  // true
1 > 3;    // false

typeof false;

console.log('Hello' + ' World');  // 'Hello World'

var multiline = 'This string...\nspans multiple lines';
console.log(multiline);
// This string...
// spans multiple lines

var quote = '"It\'s hard to fail, but it is worse never to have tried to succeed." - Theodore Roosevelt';
var quote = "\"It's hard to fail, but it is worse never to have tried to succeed.\" - Theodore Roosevelt";


console.log(quote);

console.log(1 + 'a');  // 1a
console.log('a' + 1);  // a1

var firstName = 'John';
var lastName = 'Doe';
console.log(firstName + ' ' + lastName);  // John Doe

console.log('hello'.charAt(1));  // 'e'
console.log('hello'[1]);         // 'e'

console.log('hello'.length)  // 5

'hello'.length  // 5

var l = 'hello'.length
console.log(l);

var str = 'aaa bbb ccc ' +
          'ddd eee fff'

var str = 'aaa bbb ccc \
ddd eee fff'

console.log(str);

a = 'hello';
a.toUpperCase();
console.log(a);  // 'hello'

a = a.toUpperCase();
console.log(a);  // 'HELLO'

// 'hello' is not mutated
// a new 'HELLO' str is returned

// _count
// $price
// value
// my_variable
// otherVariable


// single declaration
var myVariable;

// multiple declaration
var myVariable;
var otherVariable;
var anotherVariable;

var number;
number = 3;  // variable number is assigned with value 3


// single declaration with initialization
var myVariable = 'Hello, World!';

// multiple declaration and initialization
var myVariable = 'Hello, World';
var otherVariable = 23;
var anotherVariable = true;

var foo;
foo;      // undefined

console.log(foo);


var myVar = 'Hello world';
myVar = 23;
console.log(myVar);

// initialize to a string
var myVariable = 'Hello, World';

// re-assign to a number
myVariable = 23;

// now the variable holds a number value
myVariable;      // 23

console.log(10 % 3);   // 1
console.log(10 % -3);  // 1 (instead of -2 in Ruby)


console.log('a' < 'b'); // true
console.log('Ant' > 'Falcon');
console.log('50' < '6');

var a = 'Hello';
a += ' world';
console.log(a);

'a' < 'b';        // true
'Ant' > 'Falcon'; // false
// String comparisons use Unicode lexicographical ordering
'50' < '6';       // true ('5' precedes '6' lexicographically)

// works similarly to the numberic +=
var a = 'Hello';
a += ', world!';
a;       // "Hello, world!"


true && true;   // true
true && false;  // false
false && true;  // false
false && false; // false
false && [];    // false


true || true;    // true
true || false;   // true
false || true;   // true
false || false;  // false
false || [];     // []
// (second operand is non-boolean, it is returned as is)


!true;   // false
!false;  // true
!!true;  // true
!1;      // false
![];     // false