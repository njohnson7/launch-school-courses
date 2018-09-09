function startsWith(str, searchStr) {
  for (var i = 0, temp = ''; i < searchStr.length; i++) {
    temp += str[i];
  }

  return temp === searchStr;
}

function startsWith(str, searchStr) {
  for (var i = 0; i < searchStr.length; i++) {
    if (str[i] !== searchStr[i]) return false;
  }

  return true;
}

var str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We'));       // true
console.log(startsWith(str, 'We put'));   // true
console.log(startsWith(str, ''));         // true
console.log(startsWith(str, 'put'));      // false

var longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString));      // false


var str = 'We put comprehension and mastery above all else';
str.startsWith('We');       // true
str.startsWith('We put');   // true
str.startsWith('put');      // false
str.startsWith('Put');      // false
str.startsWith('put', 3);   // true
