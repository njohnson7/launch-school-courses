// return true if all chars in string are unique
// ignore multiple spaces and case differences

function isAllUnique(str) {
  var counts = str.toLowerCase().replace(/\s/g, '').split('')
    .reduce((counts, char) => {
      counts[char] ? counts[char]++ : counts[char] = 1;
      return counts;
    }, {});

  return Object.keys(counts).every(key => counts[key] < 2);
}


// alt:
function isAllUnique(str) {
  var counts = {};

  for (var i = 0; i < str.length; i++) {
    var char = str[i].toLowerCase();
    if (char === ' ') continue;
    counts[char] = counts[char] || 0;
    counts[char]++;
    if (counts[char] > 1) return false;
  }

  return true;
}


// alt 2:
function isAllUnique(str) {
  var chars = [];

  for (var i = 0; i < str.length; i++) {
    var char = str[i].toLowerCase();
    if (char === ' ') continue;
    if (chars.includes(char)) return false;
    chars.push(char);
  }

  return true;
}

console.log(isAllUnique('The quick brown fox jumped over a lazy dog')); // false
console.log(isAllUnique('123,456,789'));                                // false
console.log(isAllUnique('The big apple'));                              // false
console.log(isAllUnique('The big apPlE'));                              // false
console.log(isAllUnique('!@#$%^&*()'));                                 // true
console.log(isAllUnique('abcdefghijklmnopqrstuvwxyz'));                 // true
