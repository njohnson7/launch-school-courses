



var initials = ['A', 'H', 'E'];
initials + 'B';   // 'A,H,EB'
initials;         // ['A', 'H', 'E']

var initials = ['A', 'H', 'E'];
initials + ['B']; // 'A,H,EB'
initials;         // ['A', 'H', 'E']

[1] * 2;              // 2
[1, 2] * 2;           // NaN


var a = ['Bob', 'Josie', 'Sam'];
var b = ['Bob', 'Josie', 'Sam'];
console.log(a == b);   // false
console.log(a === b);  // false

console.log(a == a);   // true
console.log(a === a);  // true

var c = a;
console.log(a == c);   // true
console.log(a === c);  // true
