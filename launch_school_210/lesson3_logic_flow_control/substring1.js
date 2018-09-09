function substr(str, start, len) {
  if (start < 0) start = str.length + start;
  for (var i = 0, result = ''; start + i < str.length && i < len; i++) {
    result += str[start + i];
  }

  return result;
}

var string = 'hello world';

console.log(substr(string, 2, 4));    // "llo "
console.log(substr(string, -3, 2));   // "rl"
console.log(substr(string, 8, 20));   // "rld"
console.log(substr(string, 0, -20));  // ""
console.log(substr(string, 0, 0));    // ""

'hello world'.substr(2, 4);   // "llo "
'hello world'.substr(-3, 2);  // "rl"
'hello world'.substr(8, 20);  // "rld"
'hello world'.substr(0, -20); // ""
'hello world'.substr(0, 0);   // ""
'hello world'.substr(1);      // "ello world"
  // goes to the end of the string if the
  //  second arg is omitted
