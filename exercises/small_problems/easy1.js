// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //=========== Odd Numbers ===========//

// // // for (let i = 1; i < 100; i++) console.log(i);

// // // [...Array(50)].forEach((_, i) => console.log(i * 2 + 1));


// // // FE:
// // // var oddNums = (min, max) => {
// // //   [...Array(Math.floor((max - min) / 2))].forEach((_, i) => console.log(i * 2 + min + min % 2 + 1));
// // // }

// // // var oddNums = (min, max) => {
// // //   [...Array(Math.floor((max - min) / 2))].forEach((_, i) => {
// // //     console.log(i * 2 + min + min % 2 + 1);
// // //   });
// // // }

// // const oddNums = (min, max) => {
// //   for (let i = min - 1 + min % 2; i <= max; i += 2) console.log(i);
// // }

// // oddNums(1, 10);
// // oddNums(1, 15);
// // oddNums(5, 21);
// // oddNums(5, 30);
// // oddNums(5, 31);
// // oddNums(123, 150);






// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //=========== Even Numbers ===========//

// // const evenNums = (min, max) => {
// //   for (let i = min + min % 2; i <= max; i += 2) console.log(i);
// // }

// // evenNums(1, 10);
// // evenNums(1, 20);
// // evenNums(5, 20);
// // evenNums(10, 20);
// // evenNums(10, 31);







// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //=========== How Big is the Room ===========//

// // var dimensions = ['length', 'width'].forEach((d, _, a) => {
// //   a[d] = prompt(`Enter the ${d} of the room in meters:`);
// // });

// // let dims = { l: 0, w: 0 };
// // for (let d in dims) dims[d] = prompt(`Enter the ${d} of the room in meters:`);
// // console.log(`The area of the room is ${a = dims.l * dims.w} square meters (${a * 10.7639} square feet).`);


// // let dims = ['length', 'width'].map(d => prompt(`Enter the ${d} of the room in meters:`));
// // console.log(`The area of the room is ${a = dims[0] * dims[1]} square meters (${a * 10.7639} square feet).`);


// // do {
// //   var type = prompt('Would you like (m)eters or (f)eet?');
// // } while (!/[mf]/i.test(type));

// // type = type === 'm' ? 'meters' : 'feet';
// // let dims = ['length', 'width'].map(d => prompt(`Enter the ${d} of the room in meters:`));
// // let area = dims.reduce((a, d) => a * d, 1);
// // let [cArea, cType] = type === 'meters' ? [(area * 10.7639), 'feet'] : [area / 10.7639, 'meters'];
// // console.log(`The area of the room is ${area.toFixed(2)} square ${type} (${cArea.toFixed(2)} square ${cType}).`);






// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //=========== Tip Calculator ===========//

// // let nums = ['bill', 'tip percentage'].map(x => Number(prompt(`What is the ${x}?`)));
// // let tip = nums.reduce((t, n) => t * n, 0.01);
// // console.log(`The tip is $${tip.toFixed(2)}\nThe total is $${(tip + nums[0]).toFixed(2)}`);







// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //=========== Sum or Product of Consecutive Integers ===========//

// // Please enter an integer greater than 0: 5
// // Enter "s" to compute the sum, "p" to compute the product. s

// // The sum of the integers between 1 and 5 is 15.


// // let num = ~~prompt('Please enter an integer greater than 0:');
// // let choice = prompt('Enter "s" to compute the sum, "p" to compute the product.');
// // let [type, result] = /s/i.test(choice)
// //   ? ['sum', [...Array(num)].reduce((s, _, i) => s + ++i, 0)]
// //   : ['product', [...Array(num)].reduce((s, _, i) => s * ++i, 1)];
// // console.log(`The ${type} of the integers between 1 and ${num} is ${result}.`);


// // // FE:
// // const computeSum = nums => nums.reduce((s, n) => s + n, 0);
// // const computeProduct = nums => nums.reduce((p, n) => p * n, 1);











// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //=========== Short Long Short ===========//

// const shortLongShort = (a, b) => {
//   let [short, long] = [a, b].sort((a, b) => a.length - b.length);
//   return `${short}${long}${short}`;
// }

// console.log(shortLongShort('abc', 'defgh'));   // "abcdefghabc"
// console.log(shortLongShort('abcde', 'fgh'));   // "fghabcdefgh"
// console.log(shortLongShort('', 'xyz'));        // "xyz"
// console.log(shortLongShort('xyz', ''));        // "xyz"
// console.log(shortLongShort('xyz', 'ab'));      // "abxyzab"
// console.log(shortLongShort('ab', 'xyz'));      // "abxyzab"






// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //=========== Leap Years Part 1 ===========//

/*
  - leap year:
    - evenly divisible by 400 ||
    - evenly divisble by 4 but not 100
*/

// const isLeapYear = year => {
//   return !(year % 400) || (!(year % 4) && !!(year % 100));
// }

// const isLeapYear = year => !(year % 400) || (!(year % 4) && !!(year % 100));


// // FE:
// function isLeapYear(year) {
//   if (year % 100 === 0) {
//     return false;
//   } else if (year % 400 === 0) {
//     return true;
//   } else {
//     return year % 4 === 0;
//   }
// }

// this will fail when year % 400 === 0

// const isLeapYear = year => {
//   return year % 4 === 0 ? year % 100 === 0 ? year % 400 === 0 : true : false;
// }

// console.log(isLeapYear(2016)   === true);
// console.log(isLeapYear(2015)   === false);
// console.log(isLeapYear(2100)   === false);
// console.log(isLeapYear(2400)   === true);
// console.log(isLeapYear(240000) === true);
// console.log(isLeapYear(240001) === false);
// console.log(isLeapYear(2000)   === true);
// console.log(isLeapYear(1900)   === false);
// console.log(isLeapYear(1752)   === true);
// console.log(isLeapYear(1700)   === false);
// console.log(isLeapYear(1)      === false);
// console.log(isLeapYear(100)    === false);
// console.log(isLeapYear(400)    === true);







// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //=========== Leap Years Part 2 ===========//

// const isLeapYear = year => {
//   return (year <= 1752 && !(year % 4)) || (!(year % 400) || (!(year % 4) && !!(year % 100)));
// }


// console.log(isLeapYear(2016)   === true);
// console.log(isLeapYear(2015)   === false);
// console.log(isLeapYear(2100)   === false);
// console.log(isLeapYear(2400)   === true);
// console.log(isLeapYear(240000) === true);
// console.log(isLeapYear(240001) === false);
// console.log(isLeapYear(2000)   === true);
// console.log(isLeapYear(1900)   === false);
// console.log(isLeapYear(1752)   === true);
// console.log(isLeapYear(1700)   === true);
// console.log(isLeapYear(1)      === false);
// console.log(isLeapYear(100)    === true);
// console.log(isLeapYear(400)    === true);






// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //=========== Multiples of 3 and 5 ===========//

// const multisum = num => {
//   let sum = 0;

//   for (let i = 1; i <= num; i++) {
//     if (i % 3 === 0 || i % 5 === 0) sum += i;
//   }

//   return sum;
// }


// const multisum = num => {
//   return [...Array(num)].map((_, i) => ++i)
//                         .filter(n => !(n % 3 && n % 5))
//                         .reduce((sum, n) => sum + n);
// }


// const multisum = num => {
//   return [...Array(num)].reduce((sum, _, i) => sum + (!(++i % 3 && i % 5) ? i : 0), 0);
// }


// console.log(multisum(3));      // 3
// console.log(multisum(5));      // 8
// console.log(multisum(10));     // 33
// console.log(multisum(1000));   // 234168

// console.log(multisum(3) ===    3);
// console.log(multisum(5) ===    8);
// console.log(multisum(10) ===   33);
// console.log(multisum(20) ===   98);
// console.log(multisum(1000) === 234168);





// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //=========== ASCII String Value ===========//

// const asciiValue = str => {
//   return str.split('').reduce((sum, char) => sum + char.charCodeAt(0), 0);
// }

const asciiValue = str => str.split('').reduce((sum, char) => sum + char.charCodeAt(), 0);


console.log(asciiValue('Four score'));         // 984
console.log(asciiValue('Launch School'));      // 1251
console.log(asciiValue('a'));                  // 97
console.log(asciiValue(''));                   // 0

console.log('======');

console.log(asciiValue('Four score') ===    984);
console.log(asciiValue('Launch School') === 1251);
console.log(asciiValue('a') ===             97);
console.log(asciiValue('') ===              0);

