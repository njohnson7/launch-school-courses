




typeof true;                          // "boolean"
typeof Boolean(true);                 // "boolean"
typeof new Boolean(true);             // "object"
typeof (new Boolean(true)).valueOf(); // "boolean"

typeof "abc";                         // "string"
typeof String("abc");                 // "string"
typeof new String("abc");             // "object"
typeof (new String("abc")).valueOf(); // "string"

typeof 123;                           // "number"
typeof Number(123);                   // "number"
typeof new Number(123);               // "object"
typeof (new Number(123)).valueOf();   // "number"


String.prototype.returnMe= function() {
    return this;
}
var a = "abc";
var b = a.returnMe();
a;        // "abc"
typeof a; // "string" (still a primitive)
b;        // "abc"
typeof b; // "object"

Number.prototype.toString = function() {
    return typeof this;
}
(123).toString(); // "object"

var a = '';
new Boolean(a).valueOf(); // false

Array.from(Array(10).keys());
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var x = 1;
function x() {
  console.log('f');
}
x;



(17).toString();     // '17'
(17.2).toString();   // '17.2'
(17).toString(2);    // '10001'
(17).toString(16);   // '11
(254).toString(16);  // 'fe'
(-10).toString(2);   // '-1010'
(-0xff).toString(2); // '-11111111'