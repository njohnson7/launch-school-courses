// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============= How Old is Teddy ============///

// console.log(`Teddy is ${~~(Math.random() * 181 + 20)} years old!`);



// // FE:


// const randomBetween = (min, max) => {
//   if (min > max) [min, max] = [max, min];
//   return ~~(Math.random() * (++max - min) + min);
// };

// var result = [];
// [...Array(10000)].forEach(() => result.push(randomBetween(20, 200)));

// console.log(Math.min(...result));
// console.log(Math.max(...result));
// console.log(result.sort((a, b) => a - b));
// console.log(new Set(result));



// // // same function as LS solution, but using Math.round instead of Math.floor:
// // function randomBetween(min, max) {
// //   return Math.round(Math.random() * (max - min + 1)) + min;
// // }

// // let nums = [...Array(100000)].map(() => randomBetween(20, 200));

// // console.log(Math.min(...nums));  //  20 (same as before)
// // console.log(Math.max(...nums));  // 201 (instead of 200)
// // console.log(new Set(nums).size); // 182 (instead of 181)








// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============= Searching 101 ============///

// let nums = ['1st', '2nd', '3rd', '4th', '5th', 'last']
//   .map(nth => prompt(`Enter the ${nth} number:`));
// let msg = nums.slice(0, 5).includes(...nums.slice(-1)) ? 'appears' : 'does not appear';

// console.log(`The number ${nums.slice(-1)} ${msg} in [${nums.slice(0, 5).join(', ')}].`);




// // FE:

// const isIncluded = (arr, val) => arr.some(v => val > v);

// console.log(isIncluded([1,2,3], 2));
// console.log(isIncluded([1,2,3], 6));
// console.log(isIncluded([1,2,3,4,5], 6));
// console.log(isIncluded([1,2,3,4,5], 4));
// console.log(isIncluded([42, 20, 11, 15, 8], 4));
// console.log(isIncluded([42, 20, 11, 15, 8], -5));
// console.log(isIncluded([42, 20, 11, 15, 8], 8));
// console.log(isIncluded([42, 20, 11, 15, 8], 9));





// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============= When Will I Retire ============///

// let currentAge = prompt('What is your age?'); // 30
// let retireAge = prompt('At what age would you like to retire?'); // 70

// console.log(`It's ${new Date().getFullYear}. You will retire in ${}`);



// let yearsLeft = ['What is your age?', 'At what age would you like to retire?']
//   .map(msg => prompt(msg)).reduce((ageNow, ageRetire) => ageRetire - ageNow);
// let yearNow = new Date().getFullYear();

// console.log(`It's ${yearNow}. You will retire in ${yearNow + yearsLeft}.`);
// console.log(`You have only ${yearsLeft} years of work to go!`);



// // It's 2016. You will retire in 2056.
// // You have only 40 years of work to go!









// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============= Palindromic Strings Part 1 ============///

// const isPalindrome = str => str === [...str].reverse().join('');


// const isPalindrome = str => str === str.replace(/./g, (c, i) => str[str.length - ++i]);



// const isPalindrome = str => (
//   str === str.replace(/./g, (c, i) => str.substr(-++i, 1))
// );


// console.log(isPalindrome('madam'));           // true
// console.log(isPalindrome('Madam'));           // false (case matters)
// console.log(isPalindrome('madam i\'m adam')); // false (all characters matter)
// console.log(isPalindrome('356653'));          // true
// console.log(isPalindrome('abcde'));           // false
// console.log(isPalindrome('abcba'));           // true










// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============= Palindromic Strings Part 2 ============///

// const isRealPalindrome = str => (
//   isPalindrome(str.replace(/[^a-z\d]/gi, '').toLowerCase())
// );

// console.log(isRealPalindrome('madam'));               // true
// console.log(isRealPalindrome('Madam'));               // true (case does not matter)
// console.log(isRealPalindrome('Madam, I\'m Adam'));    // true (only alphanumerics matter)
// console.log(isRealPalindrome('356653'));              // true
// console.log(isRealPalindrome('356a653'));             // true
// console.log(isRealPalindrome('123ab321'));            // false










// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============= Palindromic Number ============///

// const isPalindromicNumber = num => String(num) === [...String(num)].reverse().join('');



// const isPalindromicNumber = num => isPalindrome(`${num}`);



// // const isPalindromicNumber = num => isPalindrome(''+num);


// console.log(isPalindromicNumber(34543));        // true
// console.log(isPalindromicNumber(123210));       // false
// console.log(isPalindromicNumber(22));           // true
// console.log(isPalindromicNumber(5));            // true








// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============= Running Totals ============///


// const runningTotal = nums => (
//   nums.map((_, i) => nums.slice(0, ++i).reduce((sum, n) => sum + n))
// );



// console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
// console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
// console.log(runningTotal([3]));                    // [3]
// console.log(runningTotal([]));                     // []










// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============= Letter Swap ============///

// const swap = str => str.replace(/(\w)(\w*)(\w)/g, '$3$2$1');



// // const swap = str => str.split(' ').map(w => w.replace(/(\w)(\w*)(\w)/g, '$3$2$1')).join(' ');



// // const swap = str => str.split(' ').map(w => w[1] && `${w.slice(-1)}${w.slice(1, -1)}${w[0]}` || w).join(' ');


// console.log(swap('Oh what a wonderful day it is'));    // 'hO thaw a londerfuw yad ti si'
// console.log(swap('Abcde'));                            // 'ebcdA'
// console.log(swap('a'));                                // 'a'

// console.log(swap('Oh what a wonderful day it is') === 'hO thaw a londerfuw yad ti si');
// console.log(swap('Abcde') ===                         'ebcdA');
// console.log(swap('a') ===                             'a');




// 'abc'.substr(-1);
// 'abc'.slice(-1);
// ['a', 'b', 'c'].slice(-1);




// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============= Letter Counter Part 1 ============///

// // const wordSizes = str => (
// //   str.split(' ')
// //      .filter(word => word)
// //      .map(word => word.length)
// //      .reduce((counts, n) => (counts[n] ? counts[n]++ : counts[n] = 1, counts), {})
// // );



// // const wordSizes = str => (
// //   (str.match(/\S+/g) || []).map(word => word.length)
// //     .reduce((counts, n) => (counts[n] ? counts[n]++ : counts[n] = 1, counts), {})
// // );


// // const wordSizes = str => (
// //   (str.match(/\S+/g) || []).map(word => word.length)
// //     .reduce((counts, n) => (counts[n] = counts[n] || 0, counts[n]++, counts), {})
// // );




// console.log(wordSizes('Four score and seven.')); // { "3": 1, "4" : "1", "5": 1, "6": 1 }
// console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));
// // { "3": 5, "6": 1, "7": 2 }

// console.log(wordSizes('What\'s up doc?')); // { "6": 1, "2": 1, "4": 1 }
// console.log(wordSizes('')); // {}








// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============= Letter Counter Part 2 ============///


// const wordSizes = str => (
//   (str.replace(/[^a-z ]/gi, '').match(/\S+/g) || []).map(word => word.length)
//     .reduce((counts, n) => (counts[n] ? counts[n]++ : counts[n] = 1, counts), {})
// );


// console.log(wordSizes('Four score and seven.'));  // { "3": 1, "4": 1, "5": 2 }
// console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!')); // { "3": 5, "6": 3 }
// console.log(wordSizes('What\'s up doc?'));        // { "5": 1, "2": 1, "3": 1 }
// console.log(wordSizes(''));                       // {}
// console.log(wordSizes("it's cool"));              // {'3': 1, '4': 1}



