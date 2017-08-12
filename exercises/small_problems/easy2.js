// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============ Ddaaiillyy ddoouubbllee ===========//

// const crunch = str => {
//   return str.replace(/(.)\1+/g, '$1');
// }


// const crunch = str => str.replace(/(.)\1+/g, '$1');



// // FE:

// // const crunch = str => {
// //   return str.split('').reduce((result, c, i) => result + (str[i + 1] === c ? '' : c), '');
// // }


// const crunch = str => {
//   return str.split('').reduce((result, c) => result + (result.slice(-1) === c ? '' : c), '');
// }


// const crunch = (str, result = '') => {
//   if (str.length === 0) return result;
//   if (result.slice(-1) !== str[0]) result += str[0];
//   return crunch(str.slice(1), result);
// }


// const crunch = (str, result = '') => {
//   if (str.length === 0) return result;
//   return crunch(str.slice(1), result + (result.slice(-1) === str[0] ? '' : str[0]));
// }


// console.log(crunch('ddaaiillyy ddoouubbllee')); //  'daily double');
// console.log(crunch('4444abcabccba')); //            '4abcabcba');
// console.log(crunch('ggggggggggggggg')); //          'g');
// console.log(crunch('a')); //                        'a');
// console.log(crunch('')); //                         '');
// console.log('======');
// console.log(crunch('ddaaiillyy ddoouubbllee') === 'daily double');
// console.log(crunch('4444abcabccba') ===           '4abcabcba');
// console.log(crunch('ggggggggggggggg') ===         'g');
// console.log(crunch('a') ===                       'a');
// console.log(crunch('') ===                        '');




// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============ Bannerizer ===========//

// // const logInBox = str => {
// //   let mid = `| ${str} |`;
// //   let topBot = `+${'-'.repeat(str.length + 2)}+`;
// //   let padding = mid.replace(/[^|]/g, ' ');
// //   console.log([topBot, padding, mid, padding, topBot].join('\n'));
// // }



// // FE:

// const logInBox = (str, width = str.length) => {
//   let topBot  = `+${'-'.repeat(width + 2)}+`;
//   let padding = `|${' '.repeat(width + 2)}|`;
//   let mid = str
//     ? str.match(RegExp(`.{1,${width}}`, 'g')).map(s => `| ${s.padEnd(width)} |`)
//     : [padding];

//   console.log([topBot, padding, ...mid, padding, topBot].join('\n'));
// }


// logInBox('To boldly go where no one has gone before.');
// // +--------------------------------------------+
// // |                                            |
// // | To boldly go where no one has gone before. |
// // |                                            |
// // +--------------------------------------------+

// logInBox('');
// // +--+
// // |  |
// // |  |
// // |  |
// // +--+

// logInBox('To boldly go where no one has gone before.', 20);
// // +----------------------+
// // |                      |
// // | To boldly go where n |
// // | o one has gone befor |
// // | e.                   |
// // |                      |
// // +----------------------+




// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============ Stringy Strings ===========//

// // const stringy = num => {
// //   return '10'.repeat(num).substr(0, num);
// // }


// // const stringy = n => '10'.repeat(n).substr(0, n);


// const stringy = n => '10'.repeat(n).slice(0, n);

// console.log(stringy(6)); // '101010'
// console.log(stringy(9)); // '101010101'
// console.log(stringy(4)); // '1010'
// console.log(stringy(7)); // '1010101'

// console.log('======');

// console.log(stringy(6) === '101010');
// console.log(stringy(9) === '101010101');
// console.log(stringy(4) === '1010');
// console.log(stringy(7) === '1010101');







// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============ Fibonacci Number Location by Length ===========//

// const findFibonacciIndexByLength = n => {
//   let [a, b] = [1, 1];
//   let i = 1;

//   while (String(a).length < n) {
//     [a, b] = [b, a + b];
//     i++;
//   }

//   return i;
// }


const findFibonacciIndexByLength = n => {
  for (var [a, b, i] = [1, 1, 1]; String(a).length < n; [a, b, i] = [b, a + b, i + 1]) {}
  return i;
}

console.log(findFibonacciIndexByLength(2));     // 7
console.log(findFibonacciIndexByLength(10));    // 45
console.log(findFibonacciIndexByLength(16));    // 74

console.log('======');

console.log(findFibonacciIndexByLength(2)  ===  7);
console.log(findFibonacciIndexByLength(10) === 45);
console.log(findFibonacciIndexByLength(16) === 74);

// GIVEN SOLUTION DOESN'T WORK FOR:
console.log(findFibonacciIndexByLength(1)  ===  1);




// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============ Right Triangles ===========//









// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============ Madlibs ===========//









// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============ Double Doubles ===========//









// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============ Grade book ===========//









// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============ Clean Up the Words ===========//










// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============ What Century is That ===========//




