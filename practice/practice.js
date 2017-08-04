


var strPrim = 'foo';
var strObj = new String(strPrim);

console.log(typeof strPrim); // "string"
console.log(typeof strObj);  // "object"


var str = 'abc';
console.log(str.length);    // 3
console.log(str.charAt(1)); // 'b'

String(null); // 'null'
String(undefined); // 'undefined'