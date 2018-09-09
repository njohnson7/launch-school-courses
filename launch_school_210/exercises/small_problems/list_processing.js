// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============= Alphabetical Numbers =============//

// // const NUMS = {
// //   0: 19, 1: 9, 2: 18, 3: 16, 4: 5, 5: 4, 6: 12, 7: 10, 8: 0, 9: 7, 10: 14,
// //   11: 2, 12: 17, 13: 15, 14: 6, 15: 3, 16: 13, 17: 11, 18: 1, 19: 8
// // };


// const NUMS = [19, 9, 18, 16, 5, 4, 12, 10, 0, 7, 14, 2, 17, 15, 6, 3, 13, 11, 1, 8];
// const alphabeticNumberSort = nums => [...nums].sort((a, b) => NUMS[a] - NUMS[b]);


// let numz = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
// let numz2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 19, 4, 2, 1, 9, 2, 1,2,3,5,19,11,1,11,15,18,12,11,1,3,3,0,9,3, 11, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

// let shuff1 = shuffle(numz);
// let shuff2 = shuffle(numz2);

// let sorted1 = alphabeticNumberSort(shuff1);
// let sorted2 = alphabeticNumberSort(shuff2);

// p(eql(sorted1, alphabeticNumberSort(shuff1)));
// p(eql(sorted2, alphabeticNumberSort(shuff2)));


// console.log('======');


// p(eql(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
//       [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));

// p(eql(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
//       [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));


// console.log('~~~~~');


// // p(alphabeticNumberSort2([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// // // [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

// p(eql(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
//       [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));

// p(eql(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
//       [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));

// p(elog(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
//       [8, 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));

// p(elog(alphabeticNumberSort([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
//       [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2]));

// p(eql(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
//       [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));










// /*---------------- 2 -----------------*/console.log('\n-------------------');
// //============= Sum of Digits =============//


// const sum = num => [...`${num}`].reduce((s, n) => s + +n, 0);



// const sum = num => num && num % 10 + sum(~~(num / 10)) || 0;



// const sum = num => num ? num % 10 + sum(~~(num / 10)) : 0;




// p(sum(23));          // 5
// p(sum(496));         // 19
// p(sum(123456789));   // 45







// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============= Multiply All Pairs =============//


// const multiplyAllPairs = (a, b) => (
//   [].concat(...a.map(x => b.map(y => x * y))).sort((x, y) => x - y)
// );



// elog(multiplyAllPairs([2, 4], [4, 3, 1, 2]), [2, 4, 4, 6, 8, 8, 12, 16]);









// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============= Sum of Sums =============//


// // const sumOfSums = nums => (
// //   nums.reduce((sum, _, i) => sum + nums.slice(0, ++i).reduce((s, n) => s + n))
// // );


// // const sumOfSums = nums => (
// //   nums.reduce((sum, n, i) => sum + n * (nums.length - i), 0)
// // );


// // const sumOfSums = nums => (
// //   ''+nums ? nums.reduce((s, n) => s + n) + sumOfSums(nums.slice(0, nums.length - 1)) : 0
// // );


// const sumOfSums = (nums, len = nums.length) => (
//   len ? nums[0] * len + sumOfSums(nums.slice(1)) : 0
// );




// p(sumOfSums([3, 5, 2]));       // (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
// p(sumOfSums([1, 5, 7, 3]));    // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
// p(sumOfSums([4]));             // 4
// p(sumOfSums([1, 2, 3, 4, 5])); // 35
// p(sumOfSums([0, 1, 2, 3, 4, 5])); // 35


// // p(sumOfSums([3, 5, 2]));
// // (3) + (3 + 5) + (3 + 5 + 2) # -> (21)

// // 3 * nums.length +
// // 5 * nums.length - 1 +
// // 2 * nums.length - 2

// // 3 * 3 +
// // 5 * 2 +
// // 2 * 1







// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============= Leading Substrings =============//

// const substringsAtStart = str => [...str].map((_, i) => str.slice(0, ++i));



// // const substringsAtStart = str => (
// //   str.replace(/./g, (_, i) => `${str.slice(0, ++i)} `).match(/\S+/g)
// // );


// const substringsAtStart = str => (
//   str ? [...substringsAtStart(str.slice(0, --str.length)), str] : []
// );



// elog(substringsAtStart('abc'),   ['a', 'ab', 'abc']);
// elog(substringsAtStart('a'),     ['a']);
// elog(substringsAtStart('xyzzy'), ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']);










// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============= All Substrings =============//



// const substrings = str => (
//   [].concat(...[...str].map((_, i) => substringsAtStart(str.slice(i))))
// );


// const substrings = str => (
//   [...str].reduce((res, _, i) => [...res, ...substringsAtStart(str.slice(i))], [])
// );


// const substrings = str => (
//   str ? [...substringsAtStart(str), ...substrings(str.slice(1))] : []
// );




// elog(substrings('abcde'),
// [ 'a', 'ab', 'abc', 'abcd', 'abcde',
//   'b', 'bc', 'bcd', 'bcde',
//   'c', 'cd', 'cde',
//   'd', 'de',
//   'e' ]);







// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============= Palindromic Substrings =============//



// const palindromes = str => (
//   substrings(str).filter(s => s[1] && s === [...s].reverse().join(''))
// );


// const palindromes = str => (
//   substrings(str).filter(s => s[1] && s === s.replace(/./g, (c, i) => s.substr(-++i, 1)))
// );


// const palindromes = str => (
//   substrings(str).filter(s => /^(.{2,})\1$/.test(s + [...s].reverse().join('')))
// );


// elog(palindromes('abcd'),  []);
// p();

// elog(palindromes('madam'), ['madam', 'ada']);
// p();

// elog(palindromes('hello-madam-did-madam-goodbye'),
//   [ 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
//     'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
//     '-madam-', 'madam', 'ada', 'oo' ]);
// p();

// elog(palindromes('knitting cassettes'),
//   [ 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt' ]);










// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============= Grocery List =============//


// // const buyFruit = list => (
// //   [].concat(...list.map(([fruit, n]) => fruit.repeat(n).match(RegExp(fruit, 'g'))))
// // );


// // const buyFruit = list => (
// //   list.reduce((res, [fruit, n]) => [...res, ...Array(n).fill(fruit)], [])
// // );


// // const buyFruit = list => (
// //   list[0] ? [...Array(list[0][1]).fill(list[0][0]), ...buyFruit(list.slice(1))] : []
// // );



// const buyFruit = (list, [fruit, n] = list[0] || []) => (
//   fruit ? [...Array(n).fill(fruit), ...buyFruit(list.slice(1))] : []
// );


// elog(buyFruit([['apples', 3], ['orange', 1], ['bananas', 2]]),
//   ['apples', 'apples', 'apples', 'orange', 'bananas','bananas']);






// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============= Inventory Item Transactions =============//


// const transactionsFor = (inventoryItem, transactions) => (
//   transactions.filter(item => item.id === inventoryItem)
// );


const transactionsFor = (itemID, transactions) => (
  transactions.filter(({ id }) => id === itemID)
);






// var transactions = [ {id: 101, movement: 'in', quantity: 5, },
//                      {id: 105, movement: 'in', quantity: 10, },
//                      {id: 102, movement: 'out', quantity: 17, },
//                      {id: 101, movement: 'in', quantity: 12, },
//                      {id: 103, movement: 'out', quantity: 15, },
//                      {id: 102, movement: 'out', quantity: 15, },
//                      {id: 105, movement: 'in', quantity: 25, },
//                      {id: 101, movement: 'out', quantity: 18, },
//                      {id: 102, movement: 'in', quantity: 22, },
//                      {id: 103, movement: 'out', quantity: 15, },];

// elog(transactionsFor(101, transactions),
//   [ { id: 101, movement: 'in', quantity: 5 },
//     { id: 101, movement: 'in', quantity: 12 },
//     { id: 101, movement: 'out', quantity: 18 }, ]);









// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============= Inventory Item Availability =============//


// const isItemAvailable = (itemID, transactions) => (
//   transactionsFor(itemID, transactions)
//     .map(item => item.movement === 'in' ? item.quantity : -item.quantity)
//     .reduce((sum, n) => sum + n, 0) > 0
// );



const isItemAvailable = (itemID, transactions) => (
  transactionsFor(itemID, transactions)
    .reduce((sum, { id, movement : move, quantity: n }) =>
      sum + (move === 'in' ? n : -n), 0) > 0
);


var transactions = [ {id: 101, movement: 'in', quantity: 5, },  //////
                     {id: 105, movement: 'in', quantity: 10, }, //55555555555
                     {id: 102, movement: 'out', quantity: 17, },
                     {id: 101, movement: 'in', quantity: 12, }, //////
                     {id: 103, movement: 'out', quantity: 15, },
                     {id: 102, movement: 'out', quantity: 15, },
                     {id: 105, movement: 'in', quantity: 25, }, //55555555555
                     {id: 101, movement: 'out', quantity: 18, }, //////
                     {id: 102, movement: 'in', quantity: 22, },
                     {id: 103, movement: 'out', quantity: 15, },];

elog(isItemAvailable(101, transactions), false);
p();
elog(isItemAvailable(105, transactions), true);
