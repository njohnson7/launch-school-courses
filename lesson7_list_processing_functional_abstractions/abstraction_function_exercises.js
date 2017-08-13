// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
//======== Iteration: forEach ========//

// function myForEach(arr, func) {
//   for (var i = 0; i < arr.length; i++) {
//     func(arr[i]);
//   }
// }

// var min = Infinity;

// var getMin = function (value) {
//   min = value <= min ? value : min;
// };

// console.log(myForEach([4, 5, 12, 23, 3], getMin));     // undefined
// console.log(min);                                      // 3







// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');

// function myFilter(arr, func) {
//   var result = [];

//   for (var i = 0; i < arr.length; i++) {
//     if (func(arr[i])) result.push(arr[i]);
//   }

//   return result;
// }


// function myFilter(arr, func) {
//   var result = [];

//   arr.forEach(function (elem) {
//     if (func(elem)) result.push(elem)
//   });

//   return result;
// }

// var isPythagoreanTriple = function (triple) {
//   return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
// };

// var filtered = myFilter([{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13},
//           {a: 1, b: 2, c: 3}], isPythagoreanTriple);
// console.log(filtered);
// // returns [{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13}]




// function multiplesOfThreeOrFive(values) {
//   return values.filter(function (value) {
//     return value % 3 === 0 || value % 5 === 0;
//   })
// }

// var multiplesOfThreeOrFive = (values) => {
//   return values.filter(value => value % 3 === 0 || value % 5 === 0);
// };

// var nums = [1, 3, 5, 7, 11, 18, 16, 15];
// console.log(multiplesOfThreeOrFive(nums));







// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');



// function myMap(arr, func) {
//   var result = [];

//   arr.forEach(function (elem) {
//     result.push(func(elem));
//   });

//   return result;
// }

// var plusOne = function (n) { return n + 1; };

// console.log(myMap([1, 2, 3, 4], plusOne));       // [2, 3, 4, 5]




// function getBooksTitle(books) {
//   return myMap(books, function (book) {
//     return book.title;
//   });
// }

// var books = [
//   {
//     title: 'JavaScript and JQuery: Interactive Front-End Web Development',
//     author: 'Jon Ducket',
//     edition: '1st',
//   },
//   {
//     title: 'Eloquent JavaScript: A Modern Introduction to Programming',
//     author: 'Haverbeke',
//     edition: '2nd',
//   },
//   {
//     title: 'Learning Web Design: A Beginner\'s Guide to HTML, CSS, JavaScript, and Web Graphics',
//     author: 'Jennifer Niederst Robbins',
//     edition: '4th',
//   },
// ];

// console.log(getBooksTitle(books));






// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');

// function myReduce(arr, func, initial) {
//   var [acc, i] = initial === undefined ? [arr[0], 1] : [initial, 0];

//   arr.slice(i).forEach(function (elem) {
//     acc = func(acc, elem);
//   });

//   return acc;
// }

// var smallest = function (result, value) {
//   return result <= value ? result : value;
// };

// var sum = function (result, value) {
//   return result + value;
// };


// console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
// console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49



// function longestWord(words) {
//   return myReduce(words, function (longest, word) {
//     return word.length > longest.length ? word : longest;
//   }, '');
// }

// console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"








// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');

// function odd(num) {
//   return num % 2 === 1;
// }
// var count = [1, 2, 3, 4, 5];
// count.some(odd);  // true,  some numbers are odd
// count.every(odd); // false, every number is not odd









// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');

// function myOwnEvery(arr, func) {
//   for (var i = 0; i < arr.length; i++) {
//     if (!func(arr[i])) return false;
//   }

//   return true;
// }

// var isAString = function (value) {
//   return typeof value === 'string';
// };

// console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));  // true
// console.log(myOwnEvery(['a', 'a234', 1], isAString));       // false




// function areAllNumbers(arr) {
//   return myOwnEvery(arr, isANumber);
// }

// var isANumber = function(value) {
//   return typeof value === 'number';
// };

// console.log(areAllNumbers([1, 5, 6, 7, '1']));             // false
// console.log(areAllNumbers([1, 5, 6, 7, 1]));               // true







// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');


// function compareScores(a, b) {
//   if      (a < b) return -1;
//   else if (a > b) return  1;
//   else            return  0;
// }
// var scores = [88, 50, 60, 99, 12, 23];
// console.log(scores.sort(compareScores));
// console.log(scores);
// // both log: [12, 23, 50, 60, 88, 99]



// var studentGrades = [
//   { name: 'StudentA', grade: 90.1, },
//   { name: 'StudentB', grade: 92, },
//   { name: 'StudentC', grade: 91.8, },
//   { name: 'StudentD', grade: 95.23, },
//   { name: 'StudentE', grade: 91.81, }
// ];

// function compareGrades(a, b) {
//   if (a.grade < b.grade) return 1;
//   else if (a.grade > b.grade) return -1;
//   else return 0;
// }

// studentGrades.sort(compareGrades);
// console.log(studentGrades);







// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
//======= Combining Abstractions =======//

// var names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];

// var freqs = names.reduce((freqs, name) => {
//   freqs[name[0]] ? freqs[name[0]]++ : freqs[name[0]] = 1;
//   return freqs;
// }, {});

// console.log(freqs);

// var result = 0;
// var mostFreq = null;

// Object.keys(freqs).forEach(key => {
//   if (freqs[key] > result) {
//     result = freqs[key];
//     mostFreq = key;
//   }
// });

// console.log(result, mostFreq);




// var names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
// var firstLetters = names.map(name => name[0]);

// console.log(firstLetters);

// var uniq = Array.from(new Set(firstLetters));
// console.log(uniq);

// console.log('=====');



// var names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
// var firstLetters = names.map(name => name[0]);

// var counts = firstLetters.reduce(function (counts, letter) {
//   counts[letter] = counts[letter] || 0;
//   counts[letter]++;
//   return counts;
// }, {});

// console.log(counts);


// var max = Object.keys(counts).reduce(function (max, letter) {
//   return counts[max] > counts[letter] ? max : letter;
// });

// console.log(max);








// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
//======= Functional Abstractions on Objects =======//

var obj = { a: 1, b: 2, c: 3 };

Object.keys(obj).forEach(function (key) {
  console.log(`key: ${key} | value: ${obj[key]}`);
});



var obj = { a: 1, b: 2, c: 3 };

Object.keys(obj).forEach(key => {
  console.log(`key: ${key} | value: ${obj[key]}`);
});



var obj = { a: 1, b: 2, c: 3 };
var keys = Object.keys(obj);        // ['a', 'b', 'c']
var values = keys.map(k => obj[k]); // [1, 2, 3]

console.log(keys);
console.log(values);

console.log('======');


// map to a new object w/ values doubled from obj:
function doubleValues(obj) {
  var newObj = {};
  Object.keys(obj).forEach(key => {
    newObj[key] = obj[key] * 2; // side-effect
  });
  return newObj;
}
doubleValues({ a: 1, b: 2, c: 3 }); // {a: 2, b: 4, c: 6}

// filter an object to only select values w/ even numbers:
function keepEvenValues(obj) {
  newObj = {}
  Object.keys(obj).forEach(key => {
    if (obj[key] % 2 === 0) newObj[key] = obj[key];
  });
  return newObj;
}
keepEvenValues({a: 1, b: 2, c: 3}); // {b: 2}

// reduce an invoice object:
function getTotal(obj) {
  var values = Object.keys(obj).map(key => obj[key]);
  var total = values.reduce((sum, n) => sum + n, 0);
  return { total: total }
}
getTotal({phone: 10000, internet: 8000, tax: 3000});
// {total:  21000}
