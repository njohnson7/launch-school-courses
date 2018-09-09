// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //================== Lettercase Percentage Ratio ====================//

// const letterPercentages = str => ( {
//   lowercase: p(str.replace(/[^a-z]/g, '').length / str.length * 100),
//   uppercase: p(str.replace(/[^A-Z]/g, '').length / str.length * 100),
//   neither:   p(str.replace(/[a-z]/gi, '').length / str.length * 100),
// });



// FIXXXXXXXX..................................
// const letterPercentages = (str, [l, u, n] = [0, 0, 0], c = str[0]) => {
//   if (!c) return {lowercase: l, u, n};

//   return letterPercentages(str.slice(1),
//     [[l, /[a-z]/], [u, /[A-Z]/], [n, /[^a-z]/i]].map(([t, r]) => t + r.test(c)));
// };




// const letterPercentages = str => (
//   [['lowercase', /[^a-z]/g], ['uppercase', /[^A-Z]/g], ['neither', /[a-z]/gi]]
//     .reduce((counts, [type, pat]) => (
//       { ...counts, [type]: str.replace(pat, '').length / str.length * 100 }), {})
// );

// elog(letterPercentages('abCdef 123'), { lowercase: 50.00, uppercase: 10.00, neither: 40.00 });
// elog(letterPercentages('AbCd +Ef')  , { lowercase: 37.50, uppercase: 37.50, neither: 25.00 });
// elog(letterPercentages('123')       , { lowercase: 0.00,  uppercase: 0.00,  neither: 100.00 });









// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //================== Triangle Sides ====================//



// // const triangle = (...sides) => (
// //   ['invalid', 'equilateral', 'isosceles', 'scalene']
// //     [+(sides.sort((a, b) => a - b)[1] + Math.min(...sides) > Math.max(...sides) &&
// //       sides.every(side => side > 0)) && new Set(sides).size]
// // );




// // const triangle = (...sides) => (
// //   ['invalid', 'equilateral', 'isosceles', 'scalene']
// //     [+(sides.sort((a, b) => a - b)[1] + Math.min(...sides) > Math.max(...sides) &&
// //       Math.min(...sides) > 0) && new Set(sides).size]
// // );



// // const triangle = (...sides) => (
// //   ['invalid', 'equilateral', 'isosceles', 'scalene']
// //     [+(sides.sort((a, b) => a - b)
// //       .every((min, _, s) => min > 0 && min + s[1] > s[2])) && new Set(sides).size]
// // );


// const triangle = (...sides) => (
//   ['invalid', 'equilateral', 'isosceles', 'scalene'][+(sides.sort((a, b) => a - b)
//     .every((a, _, [, b, c]) => a > 0 && a + b > c)) && new Set(sides).size]
// );



// const triangle = (a, b, c, sides = [a, b, c].sort((x, y) => x - y)) => (
//   ['invalid', 'equilateral', 'isosceles', 'scalene']
//     [+(sides.every((a, _, [, b, c]) => a > 0 && a + b > c)) && new Set(sides).size]
// );



// elog(triangle(3, 3, 3)  , 'equilateral');
// elog(triangle(3, 3, 1.5), 'isosceles');
// elog(triangle(3, 4, 5)  , 'scalene');
// elog(triangle(0, 3, 3)  , 'invalid');
// elog(triangle(3, 1, 1)  , 'invalid');












// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //================== Tri-Angles ====================//

// //.............fix............
// // const triangle = (...sides) => (
// //   sides.some((a, _, [, b, c]) => a > 0 && (p(s) + p(a[1]) + p(a[2]) === 180))
// // );



// // const triangle = (...sides) => (
// //   Math.min(...sides) > 0 && sides.reduce((s, n) => s + n, 0) === 180
// // );

// // def triangle(*angles)
// //   angles = [] unless angles.all?(&:positive?) && angles.reduce(:+) == 180
// //   %i[invalid right obtuse acute][angles.count { |a| a < 90 } - angles.count { |a| a == 90 }]
// // end



// const triangle = (a, b, c, types = ['invalid', 'right', 'obtuse', 'acute']) => (
//   types[+(Math.min(a, b, c) > 0 && a + b + c === 180) &&
//     [a, b, c].filter(x => x < 90).length - [a, b, c].filter(x => x === 90).length]
// );


// elog(triangle(60, 70, 50) , 'acute');
// elog(triangle(30, 90, 60) , 'right');
// elog(triangle(120, 50, 10), 'obtuse');

// p()

// elog(triangle(0, 90, 90)  , 'invalid');
// elog(triangle(90, 90, 0)  , 'invalid');
// elog(triangle(90, 45, -135)  , 'invalid');
// elog(triangle(50, 50, 50) , 'invalid');















// ---------------- 4 -----------------console.log('\n--------- 4 ----------');
// //================== Unlucky Days ====================//


// // const fridayThe13ths = year => (
// //   [...Array(12).keys()].filter(month => new Date(year, month, 13).getDay() === 5).length
// // );


// const fridayThe13ths = year => (
//   [...Array(12)].reduce((count, _, month) => count + +(new Date(year, month, 13).getDay() === 5), 0)
// );



// elog(fridayThe13ths(2015), 3);
// elog(fridayThe13ths(1986), 1);













// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //================== Next Featured Number Higher than a Given Value ====================//

// // odd multiple of 7, digits occur 1x each
// //   ex: 49



// // const featured = num => {
// //   num = num + 1;
// //   while (num % 7 !== 0) num += 1;
// //   if (num % 2 !== 1) num += 7;
// //   while (/.*(\d)(?=.*\1)/.test(num)) num += 14;
// //   return num;
// // };



// // const featured = num => {
// //   while (++num % 14 !== 7);
// //   while (/.*(\d)(?=.*\1)/.test(num)) num += 14;
// //   return num;
// // };


// const featured = num => {
//   if (num > 9876543200) throw 'RangeError: No next featured number.';
//   while (++num % 14 !== 7);
//   while (/(.).*\1/.test(num)) num += 14;
//   return num;
// };




// elog(featured(12)       , 21);
// p();

// elog(featured(20)       , 21);
// p();

// elog(featured(21)       , 35);
// p();

// elog(featured(997)      , 1029);
// p();

// elog(featured(1029)     , 1043);
// p();

// elog(featured(999999)   , 1023547);
// p();

// elog(featured(999999987), 1023456987);
// p();

// elog(featured(9876543200), 9876543201);
// p();

// elog(featured(9876543201), 9876543201);















// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //================== Sum Square - Square Sum ====================//



// // const sumSquareDifference = num => (
// //   [...Array(++num).keys()].reduce((sum, n) => sum + n, 0)**2 - [...Array(num).keys()].reduce((sum, n) => sum + n**2, 0)
// // );


// const sumSquareDifference = (num, nums = [...Array(++num).keys()]) => (
//   nums.reduce((sum, n) => sum + n, 0)**2 - nums.reduce((sum, n) => sum + n**2, 0)
// );


// elog(sumSquareDifference(3)  , 22);
// // -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
// p();

// elog(sumSquareDifference(10) , 2640);
// p();

// elog(sumSquareDifference(1)  , 0);
// p();

// elog(sumSquareDifference(100), 25164150);
// p();













// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //================== Bubble Sort ====================//



// // const bubbleSort = arr => {
// //   let i = 0;
// //   let newI = 0;

// //   while (true) {
// //     let startI = newI;

// //     for (i = 0; i < arr.length - 1; i++) {
// //       if (arr[i] > arr[i + 1]) {
// //         [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
// //         newI = i;
// //       }

// //       // i++;
// //     }

// //     // break;
// //     if (newI === startI) break;
// //   }
// // };


// // const bubbleSort = arr => {
// //   let n = arr.length;

// //   while (true) {
// //     let newN = 0;

// //     for (i = 1; i < n; i++) {
// //       if (arr[i - 1] <= arr[i]) continue;
// //       [arr[i - 1], arr[i]] = [arr[i], arr[i - 1]];
// //       newN = i;
// //     }

// //     if (newN === 0) return arr;
// //     n = newN;
// //   }
// // };



// // const bubbleSort = (arr, n = arr.length) => {
// //   do {
// //     var newN = 0;
// //     for (i = 1; i < n; i++) {
// //       if (arr[i - 1] <= arr[i]) continue;
// //       [arr[i - 1], arr[i]] = [arr[i], arr[i - 1]];
// //       newN = i;
// //     }
// //   } while (n = newN)
// // };



// const bubbleSort = (arr, arrCopy = JSON.stringify(arr)) => {
//   arr.forEach((elem, i) => elem > arr[i + 1] ? [arr[i], arr[i + 1]] = [arr[i + 1], elem] : '')
//   return JSON.stringify(arr) === arrCopy ? arr : bubbleSort(arr);
// };



// var arr = [5, 3];
// bubbleSort(arr);
// elog(arr, [3, 5]);
// p();

// arr = [6, 2, 7, 1, 4]
// bubbleSort(arr);
// elog(arr, [1, 2, 4, 6, 7]);
// p();

// arr = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
// bubbleSort(arr);
// elog(arr, ['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler']);
// p();
