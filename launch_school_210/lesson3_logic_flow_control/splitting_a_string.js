
function splitString(str, delimiter) {
  if (delimiter === undefined) {
    console.log('ERROR: No delimiter');
    return;
  }

  for (var i = 0, sub = '', char; i < str.length; i++) {
    char = str[i];
    if (delimiter === '') {
      console.log(char);
    } else if (char === delimiter) {
      console.log(sub);
      sub = '';
    } else {
      sub += char;
      if (i === str.length - 1) console.log(sub);
    }
  }
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

console.log('----');
splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello


var str = 'We put comprehension and mastery above all else';
str.split(' ');     // ["We", "put", "comprehension", "and", "mastery", "above", "all", "else"]
str.split('and');   // ["We put comprehension ", " mastery above all else"]
'hello'.split('');  // ["h", "e", "l", "l", "o"]
'1,2,3'.split(/,/); // ["1", "2", "3"]
