/*

input: number string
output: true/false based on if input is valid
rules:
  - input can contain spaces
  - counting from rightmost digit (check digit), and moving left, double every 2nd digit
    - for any digits that become >= 10, subtract 9 from result
    - ex:
      - 1111 => 2121
      - 8763 => 8 * 2, 7, 6 * 2, 3 => 16 - 9, 7, 12 - 9, 3 => 7, 7, 3, 3 => 7733
  - add all digits together to get checksum
    - ex:
      - 2121 => 2 + 1 + 2 + 1 => 6
      - 7733 => 20
  - if checksum % 10 === 0,  valid => true (ex: 6)
  - else, false (ex: 20)

- algo:
  - remove non digits from input
  - split input into array of digits
  - map digits arr to integers
  - reverse digits arr
  - map digits arr => (odd index digits * 2) - 9
  - reduce => sum digits
  - return sum % 10 === 0
*/


// const validLuhn = (numStr) => {
//   let digits = [...numStr.replace(/[^\d]/g, '')].map(Number).reverse();
//   digits = digits.map((d, i) => i % 2 === 1 ? d * 2 % 9: d);
//   let checksum = digits.reduce((sum, d) => sum + d, 0);
//   return checksum % 10 === 0;
// };


// const validLuhn = (numStr) => {
//   return !([...numStr.replace(/[^\d]/g, '')]
//     .reverse()
//     .map(Number)
//     .map((d, i) => i % 2 ? d * 2 % 9 : d)
//     .reduce((sum, d) => sum + d, 0) % 10);
// };


const validLuhn = (numStr) => {
  return !([...numStr.replace(/[^\d]/g, '')]
    .reverse().reduce((sum, d, i) => sum + (i % 2 ? d * 2 % 9 : +d), 0) % 10);
};


console.log(validLuhn('1111'));   // false
console.log(validLuhn('8763'));   // true
console.log(validLuhn('0'));      // true
console.log(validLuhn('10'));     // false
console.log(validLuhn('42'));     // 82 => 10 => true
console.log(validLuhn('123'));    // 143 => 8 => false
console.log(validLuhn('125'));    // 145 => 10 => true
console.log(validLuhn("2323 2005 7766 3554"));    // true
console.log(validLuhn("2323 2005 7766 3555"));    // false

console.log('=======');

console.log(validLuhn('1111') === false);
console.log(validLuhn('8763') === true);
console.log(validLuhn('0') ===    true);
console.log(validLuhn('10') ===   false);
console.log(validLuhn('42') ===   true);
console.log(validLuhn('123') ===  false);
console.log(validLuhn('125') ===  true);
console.log(validLuhn("2323 2005 7766 3554") ===  true);
console.log(validLuhn("2323 2005 7766 3555") ===  false);
