function trim(str) {
  var result = '';
  var sub = ''
  var char;
  var start = true;

  for (var i = 0; i < str.length; i++) {
    char = str[i];

    if (start) {
      if (char === ' ') continue;
      start = false;
    }

    sub += char;
    if (char !== ' ') {
      result += sub;
      sub = '';
    }
  }

  return result;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""

var str = '   foo  ';
str.trim();  // "foo"
