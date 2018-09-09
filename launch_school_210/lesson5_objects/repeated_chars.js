// return: an obj that contains count of the repeated chars
// - ignore case
// - only return counts of 2+

function repeatedCharacters(str) {
  var result = {};

  for (var i = 0; i < str.length; i++) {
    char = str[i].toLowerCase();
    if (!result[char]) result[char] = 0;
    result[char]++;
  }

  for (var char in result) {
    if (result[char] < 2) delete result[char];
  }

  return result;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
