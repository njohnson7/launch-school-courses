// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //================ 1000 Lights ================//



// const lightsOn = n => [...Array(~~(Math.sqrt(n)))].map((_, i) => ++i**2);



// // const lightsOn = n => {
// //   let lights = [...Array(n).fill(false)];

// //   for (let i = 1; i <= n; i++) {
// //     lights.forEach((_, j) => (j + 1) % i === 0 ? lights[j] = !lights[j] : lights[j])
// //   }

// //   return lights.map((light, i) => [light, i]).filter(([light, i]) => light).map(([light, i]) => ++i);
// // };



// elog(lightsOn(5),  [1, 4]);
// // detailed result of each round for 5 lights
// // Round 1: all lights are on
// // Round 2: lights 2 and 4 are now off; 1, 3, and 5 are on
// // Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// // Round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
// // Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
// p();

// elog(lightsOn(100), [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]);













// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //================ Diamonds ================//




// const diamond = n => {
//   [...[...Array(n + 1).keys()], ...[...Array(n).keys()].reverse()]
//     .forEach(i => i % 2 && console.log(`${'*'.repeat(i).padStart((n +i + 1 ) / 2)}`));
// };


// diamond(1);
// // *

// diamond(3);
// //  *
// // ***
// //  *

// diamond(9);
// //     *
// //    ***
// //   *****
// //  *******
// // *********
// //  *******
// //   *****
// //    ***
// //     *










// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //================ Now I Know My ABCs ================//





// const isBlockWord = (word, pat = '[BO]|[XK]|[DQ]|[CP]|[NA]|[GT]|[RE]|[FS]|[JW]|[HU]|[VI]|[LY]|[ZM]') => (
//   !word || RegExp(pat, 'i').test(word[0]) &&
//     isBlockWord(word.slice(1), pat.replace(RegExp(`\\[.?${word[0]}.?]\\|?`, 'i'), ''))
// );



// console.log(isBlockWord('BATCH')); // true
// console.log(isBlockWord('BUTCH')); // false
// console.log(isBlockWord('jest'));  // true












// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //================ Caesar Cipher ================//


// const ALPHA = 'abcdefghijklmnopqrstuvwxyz';


// const ALPHA = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';


// const caesarEncrypt = (str, n) => {
//   let key = ALPHA.slice(n % 26) + ALPHA.slice(0, n % 26);
//   return str.replace(/[a-z]/gi, c =>
//     key[ALPHA.indexOf(c.toLowerCase())][/[a-z]/.test(c) ? 'toLowerCase' : 'toUpperCase']())
// };



// const ALPHA = 'abcdefghijklmnopqrstuvwxyz';

// const caesarEncrypt = (str, n, key = ALPHA.slice(n % 26) + ALPHA.slice(0, n % 26)) => (
//   str.replace(/[a-z]/gi, c =>
//     key[ALPHA.indexOf(c.toLowerCase())][c > 'Z' ? 'toLowerCase' : 'toUpperCase']())
// );


// const ALPHA = 'abcdefghijklmnopqrstuvwxyz';

// const caesarEncrypt = (str, n) => {
//   let key = ALPHA.slice(n % 26) + ALPHA.slice(0, n % 26);
//   let alpha = ALPHA + ALPHA.toUpperCase();
//   key = key + key.toUpperCase();
//   return str.replace(/[a-z]/gi, c => key[alpha.indexOf(c)]);
// };




// const ALPHA = 'abcdefghijklmnopqrstuvwxyz';

// const caesarEncrypt = (str, n) => {
//   return str.replace(/[a-z]/gi, c => {
//     let newC = ALPHA[(ALPHA.indexOf(c.toLowerCase()) + n) % 26];
//     return c > 'Z' ? newC.toLowerCase() : newC.toUpperCase();
//   });
// };





// const caesarEncrypt = (str, n, char = str[0]) => {
//   if (!char) return '';
//   if (/[a-z]/i.test(char)) {
//     let base = char > 'Z' ? 97 : 65;
//     char = String.fromCharCode((char.charCodeAt(0) - base + n) % 26 + base);
//   }
//   return char + caesarEncrypt(str.slice(1), n);
// };



// const caesarEncrypt = (str, n, c = str[0], base = c > 'Z' ? 97 : 65) => (
//   str && (/[a-z]/i.test(c) ? String.fromCharCode((c.charCodeAt(0) - base + n) % 26 + base) : c)
//          + caesarEncrypt(str.slice(1), n)
// );



// // Simple shift
// elog(caesarEncrypt('A', 0),  'A')
// elog(caesarEncrypt('A', 3),  'D')
// p();

// // Wrap around
// elog(caesarEncrypt('y', 5),  'd')
// elog(caesarEncrypt('a', 47), 'v')
// p();

// // All letters
// elog(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25),
//                    'ZABCDEFGHIJKLMNOPQRSTUVWXY');
// elog(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5),
//                    'Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!');
// p();

// // Many non-letters
// elog(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2),
//                    'Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?');







// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //================ Vigenere Cipher ================//


// // const caesar = (str, n, c = str[0], base = c > 'Z' ? 97 : 65) => (
// //   str && (/[a-z]/i.test(c) ? String.fromCharCode((c.charCodeAt(0) - base + n) % 26 + base) : c)
// //          + caesar(str.slice(1), n)
// // );


// // const ALPHA = 'abcdefghijklmnopqrstuvwxyz';

// // // const caesarEncrypt = (str, n, key = ALPHA.slice(n % 26) + ALPHA.slice(0, n % 26)) => (
// // //   str.replace(/[a-z]/gi, c =>
// // //     key[ALPHA.indexOf(c.toLowerCase())][c > 'Z' ? 'toLowerCase' : 'toUpperCase']())
// // // );


// // const vigenere = (str, key, i = -1) => {
// //   let shifts = [...key.toLowerCase()].map(c => ALPHA.indexOf(c));
// //   return str.replace(/[a-z]/gi, c => caesar(c, shifts[++i % key.length]));
// // };




// // const vigenere = (str, key, char = str[0]) => {
// //   if (!char) return '';
// //   if (/[a-z]/i.test(char)) {
// //     let base = char > 'Z' ? 97 : 65;
// //     let n = 'abcdefghijklmnopqrstuvwxyz'.indexOf(key[0].toLowerCase());
// //     char = String.fromCharCode((char.charCodeAt(0) - base + n) % 26 + base);
// //     key = key.slice(1) + key[0];
// //   }
// //   return char + vigenere(str.slice(1), key);
// // };



// const vigenere = (str, key, char = str[0]) => {
//   if (str && /[a-z]/i.test(char)) {
//     let base = char > 'Z' ? 97 : 65;
//     let n = 'abcdefghijklmnopqrstuvwxyz'.indexOf(key[0].toLowerCase());
//     char = String.fromCharCode((char.charCodeAt(0) - base + n) % 26 + base);
//     key = key.slice(1) + key[0];
//   }
//   return str && char + vigenere(str.slice(1), key);
// };



// elog(vigenere("Pineapples don't go on pizzas!", 'meat'), "Bmnxmtpeqw dhz'x gh ar pbldal!");
// elog(vigenere("Pineapples don't go on pizzas!", 'A'), "Pineapples don't go on pizzas!");
// elog(vigenere("Pineapples don't go on pizzas!", 'Aa'), "Pineapples don't go on pizzas!");
// elog(vigenere("Pineapples don't go on pizzas!", 'cab'), "Riogaqrlfu dpp't hq oo riabat!");
// elog(vigenere("Dog", 'Rab'), "Uoh");









// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //================ Seeing Stars ================//



const star = (n, half = ~~(n / 2)) => {
  let rows = [...Array(half)].map((_, i) =>
    ' '.repeat(half - i - 1) + `*${' '.repeat(i)}`.repeat(2) + '*');
  console.log([...rows.slice().reverse(), '*'.repeat(n), ...rows].join('\n'));
};



star(7);
// *  *  *
//  * * *
//   ***
// *******
//   ***
//  * * *
// *  *  *
p();

star(9);
// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *
