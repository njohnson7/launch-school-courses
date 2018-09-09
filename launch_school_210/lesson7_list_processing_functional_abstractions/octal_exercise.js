/*
- input:  octal num as String
- output: decimal num as Number

- rules:  don't use any built in methods
*/

function octalToDecimal(num) {
  return num.split('').reduce((sum, n) => Number(n) + sum * 8, 0);
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
