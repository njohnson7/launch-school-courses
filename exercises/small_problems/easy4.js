// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============== Cute Angles ==============//

// // const dms = angle => {
// //   let min = (angle - ~~angle) * 60;
// //   let sec = (min - ~~min) * 60;
// //   return `${~~angle}°${String(~~min).padStart(2, '0')}'${String(~~sec).padStart(2, '0')}"`;
// // };


// // const dms = deg => {
// //   let [min, sec] = [deg, deg % 1 * 60].map(n => `${~~(n % 1 * 60)}`.padStart(2, '0'));
// //   return `${~~deg}°${min}'${sec}"`;
// // };




// // FE:

// const dms = deg => {
//   let [min, sec] = [deg, deg % 1 * 60].map(n => `${~~(n % 1 * 60)}`.padStart(2, '0'));
//   return `${~~deg % 360}°${min}'${sec}"`.replace(/-(?!.*°)/g, '');
// };


// console.log(dms(30));        // 30°00'00"
// console.log(dms(76.73));     // 76°43'48"
// console.log(dms(254.6));     // 254°35'59"
// console.log(dms(93.034773)); // 93°02'05"
// console.log(dms(0));         // 0°00'00"
// console.log(dms(360));       // 360°00'00" or 0°00'00"
// console.log(dms(540));
// console.log(dms(540.73));
// console.log(dms(-540));
// console.log(dms(-540.73));
// console.log(dms(-600.6));
// console.log(dms(-700.6));
// console.log(dms(-740.6));

// console.log('======');

// console.log(dms(30)        === `30°00'00"`);
// console.log(dms(76.73)     === `76°43'48"`);
// console.log(dms(254.6)     === `254°35'59"`);
// console.log(dms(93.034773) === `93°02'05"`);
// console.log(dms(0)         === `0°00'00"`);
// console.log(dms(360)       === `360°00'00"`);







// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============== Combining Arrays ==============//



// // const union = (a, b) => [...new Set([...a, ...b])];




// const union = (...arrs) => [...new Set([].concat(...arrs))];




// console.log(union([1, 3, 5], [3, 6, 9])); // [1, 3, 5, 6, 9]
// console.log(union([1, 3, 5], [3, 6, 9], [7,4, 1]));
// console.log(union([1, 3, 5], [3, 6, 9], [7,4, 1], [1,2,3,4,5], [], [10, 3]));
// console.log(union([1]));
// console.log(union([]));
// console.log(union([], [2]));
// console.log(union([4], [1]));
// console.log(union([1], [1]));
// console.log(union(1, 2, [3, 4]));

// console.log(union(1, 2, [3, 4], [1, 6, 2], [], 4, 9)); // [1, 2, 3, 4, 6, 9]
// console.log(union([], [1], 1, [1, 1]));                // [1]
// console.log(union());                                  // []
// console.log(union([]));                                // []








// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============== Halvsies ==============//


// const halvsies = arr => [arr.splice(0, Math.ceil(arr.length / 2)), arr];



// const halvsies = arr => [arr.slice(0, Math.ceil(arr.length / 2)), arr.slice(Math.ceil(arr.length / 2))];



// const halvsies = (arr, n = Math.ceil(arr.length / 2)) => [arr.slice(0, n), arr.slice(n)];



// console.log(halvsies([1, 2, 3, 4]));    // [[1, 2], [3, 4]]
// console.log(halvsies([1, 5, 2, 4, 3])); // [[1, 5, 2], [4, 3]]
// console.log(halvsies([5]));             // [[5], []]
// console.log(halvsies([]));              // [[], []]










// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============== Find the Duplicate ==============//


// const findDup = arr => arr.find(n => arr.indexOf(n) !== arr.lastIndexOf(n));


// const findDup = arr => +`,${[...arr].sort()},`.match(/,(\d+),\1,/)[1];


// const findDup = arr => [...arr].sort().find((n, i, a) => n === a[++i]);



// const findDup = arr => arr.find((n, i) => arr.slice(++i).includes(n));


// console.log(findDup([1, 5, 3, 1]));                              // 1
// console.log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
//            38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
//            14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
//            78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
//            89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
//            41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
//            55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
//            85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
//            40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
//            7,  34, 57, 74, 45, 11, 88, 67,  5, 58]));  // 73










// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============== Combine Two Lists ==============//


// // const interleave = (a, b) => a.reduce((result, elem, i) => [...result, elem, b[i]], []);


// // const interleave = (a, b) => (
// //   a.reduce((result, elem, i) => [...result, elem, b[i]], [])
// // );


// // const interleave = (a, b, result = []) => (
// //   a.length === 0 ? result : interleave(a.slice(1), b.slice(1), [...result, a[0], b[0]])
// // );



// const interleave = (a, b, result = []) => (
//   a.length ? interleave(a.slice(1), b.slice(1), [...result, a[0], b[0]]) : result
// );

// console.log(interleave([1, 2, 3], ['a', 'b', 'c'])); // [1, 'a', 2, 'b', 3, 'c']










// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============== Multiplicative Average ==============//


// // const showAvg = nums => (
// //   (nums.reduce((prod, n) => prod * n) / nums.length).toFixed(3)
// // );


// const showAvg = (nums, prod = 1, i = nums.length) => (
//   nums.length ? showAvg(nums.slice(1), prod * nums[0], i) : (prod / i).toFixed(3)
// );



// // const showAvg = (nums, i = nums.length) => (
// //   // nums.length ? showAvg(nums.slice(1), prod * nums[0], i) : (prod / i).toFixed(3)

// //   (nums.length ? nums[0] * showAvg(nums.slice(1), i) : 1 / i)
// // );


// console.log(showAvg([3, 5]));                 // '7.500'
// console.log(showAvg([2, 5, 7, 11, 13, 17]));  // '28361.667'












// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============== Multiply Lists ==============//


// // const multiplyList = (a, b) => a.map((n, i) => n * b[i]);



// const multiplyList = (a, b, result = []) => (
//   a.length ? multiplyList(a.slice(1), b.slice(1), [...result, a[0] * b[0]]) : result
// );


// const multiplyList = (a, b) => (
//   a.length ? [a[0] * b[0], ...multiplyList(a.slice(1), b.slice(1))] : []
// );



// console.log(multiplyList([3, 5, 7], [9, 10, 11])); // [27, 50, 77]












// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============== Digits List ==============//


// // const digitList = n => [...`${n}`].map(Number);




// // const digitList = num => (
// //   num ? [...digitList(Math.floor(num / 10)), num % 10] : []
// // );


// const digitList = n => n ? [...digitList(~~(n / 10)), n % 10] : [];



// console.log(digitList(12345));       // [1, 2, 3, 4, 5]
// console.log(digitList(7));           // [7]
// console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
// console.log(digitList(444));         // [4, 4, 4]












// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============== How Many ==============//

// // const countOccurrences = arr => {
// //   Object.entries(arr.reduce((counts, elem) => (counts[elem] ? counts[elem]++ : counts[elem] = 1, counts), {}))
// //     .forEach(([k, v]) => console.log('%s => %s', k, v));
// // };



// const countOccurrences = arr => (
//   new Map([...new Set(arr)].map(a => [a, arr.filter(b => a === b).length]))
//     .forEach((count, elem) => console.log('%s => %s', elem, count))
// );



// let vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck'];
// countOccurrences(vehicles);
// // car => 4
// // truck => 3
// // SUV => 1
// // motorcycle => 2










// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============== Array Average ==============//


// const average = nums => ~~(nums.reduce((sum, n) => sum + n / nums.length, 0));



// const average = (nums, i = nums.length) => (
//   (nums.length ? nums[0] / i + average(nums.slice(1), i) : 0)
// );


// const average = (nums, i = nums.length) => (
//   (nums.length ? nums[0] / i + average(nums.slice(1), i) : 0)
// );



// const average = (nums, avg = 0, i = nums.length) => (
//   nums.length ? average(nums.slice(1), avg + nums[0] / i, i) : Math.floor(avg)
// );


const average = (nums, sum = 0, i = 0) => (
  nums.length ? average(nums.slice(1), sum + nums[0], i + 1) : ~~(sum / i)
);



console.log(average([1, 5, 87, 45, 8, 8]));    // 25
console.log(average([1, 5, 9]));    // 5
console.log(average([9, 47, 23, 95, 16, 52])); // 40





