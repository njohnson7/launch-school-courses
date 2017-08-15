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

// // const findFibonacciIndexByLength = n => {
// //   let [a, b] = [1, 1];
// //   let i = 1;

// //   while (String(a).length < n) {
// //     [a, b] = [b, a + b];
// //     i++;
// //   }

// //   return i;
// // }



// const findFibonacciIndexByLength = n => {
//   for (var [a, b, i] = [1, 1, 1]; String(a).length < n; [a, b] = [b, a + b], i++);
//   return i;
// };





// const findFibonacciIndexByLength = n => {
//   let fibSequence = fibonacci();
//   let count = 1;
//   while (String(fibSequence.next().value).length < n) count++;
//   return count;
// };

// const fibonacci = function* () {
//   let [a, b] = [1, 1];
//   while (true) {
//     yield a;
//     [a, b] = [b, a + b];
//   }
// };




// const findFibonacciIndexByLength = (n, a = 1, b = 1) => {
//   return String(a).length >= n ? 1 : 1 + findFibonacciIndexByLength(n, b, a + b);
// };




// console.log(findFibonacciIndexByLength(2));     // 7
// console.log(findFibonacciIndexByLength(10));    // 45
// console.log(findFibonacciIndexByLength(16));    // 74

// console.log('======');

// console.log(findFibonacciIndexByLength(2)  ===  7);
// console.log(findFibonacciIndexByLength(10) === 45);
// console.log(findFibonacciIndexByLength(16) === 74);
// console.log(findFibonacciIndexByLength(1)  ===  1);










// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============ Right Triangles ===========//

// const triangle = n => {
//   [...Array(n).keys()].forEach(i => console.log('*'.repeat(++i).padStart(n)));
// };


// const triangle = (n, i = 1) => {
//   console.log('*'.repeat(i).padStart(n));
//   return i >= n ? '' : triangle(n, i + 1);
// };


// triangle(5);
// //     *
// //    **
// //   ***
// //  ****
// // *****

// triangle(9);
// //         *
// //        **
// //       ***
// //      ****
// //     *****
// //    ******
// //   *******
// //  ********
// // *********










// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============ Madlibs ===========//


// let noun = prompt('Enter a noun:');
// let verb = prompt('Enter a verb:');
// let adj = prompt('Enter an adjective:');
// let adverb = prompt('Enter an adverb:');

// console.log(`Do you ${verb} your ${adj} ${noun} ${adverb}? That's hilarious!`);




// let words = ['a noun', 'a verb', 'an adjective', 'an adverb'].map(w => prompt(`Enter ${w}:`));
// console.log(`Do you ${words[1]} your ${words[2]} ${words[0]} ${words[3]}? That's hilarious!`);








// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============ Double Doubles ===========//

// double num:
  // even length num
  // left side digits === right side digits

// output:
  // if double num => itself
  // else, 2 * num

// const twice = num => {
//   return /^(\d+)\1$/.test(String(num)) ? num : num * 2;
// };


// const twice = num => /^(\d+)\1$/.test(String(num)) ? num : num * 2;


// const twice = num => num + (/^(\d+)\1$/.test(String(num)) ? 0 : num);



// const twice = num => num + +(!/^(\d+)\1$/.test(String(num)) * num);




// console.log(twice(37));                 // 74
// console.log(twice(44));                 // 44
// console.log(twice(334433));             // 668866
// console.log(twice(444));                // 888
// console.log(twice(107));                // 214
// console.log(twice(103103));             // 103103
// console.log(twice(3333));               // 3333
// console.log(twice(7676));               // 7676

// console.log('=======');

// console.log(twice(37)     === 74);
// console.log(twice(44)     === 44);
// console.log(twice(334433) === 668866);
// console.log(twice(444)    === 888);
// console.log(twice(107)    === 214);
// console.log(twice(103103) === 103103);
// console.log(twice(3333)   === 3333);
// console.log(twice(7676)   === 7676);









// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============ Grade book ===========//

// const getGrade = (...nums) => {
//   return ['F', 'D', 'C', 'B', 'A'][~~(nums.reduce((sum, n) => sum + n, 0) / nums.length / 10 % 5)];
// };

// console.log(getGrade(95, 90, 93) === "A");
// console.log(getGrade(80, 89, 87) === "B");
// console.log(getGrade(60, 90, 74) === "C");
// console.log(getGrade(50, 50, 95) === "D");
// console.log(getGrade(58, 50, 70) === "F");
// console.log(getGrade(58, 50, 70, 30, 55, 73) === "F");
// console.log(getGrade(0)       === "F");
// console.log(getGrade()        === "F");
// console.log(getGrade(93)      === "A");
// console.log(getGrade(100, 85) === "A");
// console.log(getGrade(100, 85, 20, 30, 40, 50, 60, 70, 80)     === "F");
// console.log(getGrade(100, 85, 20, 30, 40, 50, 60, 70, 80, 90) === "D");











// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============ Clean Up the Words ===========//














// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============ What Century is That ===========//






