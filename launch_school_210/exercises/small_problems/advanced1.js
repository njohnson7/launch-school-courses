// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============== Madlibs Revisited ============//

// // const ADJS    = ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'];
// // const NOUNS   = ['fox', 'dog', 'head', 'leg', 'tail'];
// // const VERBS   = ['jumps', 'lifts', 'bites', 'licks', 'pats'];
// // const ADVERBS = ['easily', 'lazily', 'noisily', 'excitedly'];



// const WORDS = {
//   adj:    ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'],
//   noun:   ['fox', 'dog', 'head', 'leg', 'tail'],
//   verb:   ['jumps', 'lifts', 'bites', 'licks', 'pats'],
//   adverb: ['easily', 'lazily', 'noisily', 'excitedly'],
//   sample:  arr => arr[~~(Math.random() * arr.length)],
// };

// const madlibs = template => (
//   template.replace(/#{(\w+)}/g, (_, type) => WORDS.sample(WORDS[type]))
// );

// const template1 = 'The #{adj} brown #{noun} #{adverb} #{verb} the #{adj} yellow #{noun}, who #{adverb} #{verb} his #{noun} and looks around.';
// const template2 = "The #{noun} #{verb} the #{noun}'s #{noun}.";





// p(madlibs(template1));
// // The "sleepy" brown "cat" "noisily"
// // "licks" the "sleepy" yellow
// // "dog", who "lazily" "licks" his
// // "tail" and looks around.
// p();

// p(madlibs(template1));
// // The "hungry" brown "cat" "lazily"
// // "licks" the "noisy" yellow
// // "dog", who "lazily" "licks" his
// // "leg" and looks around.
// p();

// p(madlibs(template2));
// // The "fox" "bites" the "dog"'s "tail".
// p();

// p(madlibs(template2));
// // The "cat" "pats" the "cat"'s "head".
// p();












// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============== Transpose 3x3 ============//


// // const transpose = arr => (
// //   arr.map((_, y) => arr.map((_, x) => arr[x][y]))
// // );


// const transpose = arr => arr.map((_, i) => arr.map(a => a[i]));




// var matrix = [
//    [1, 5, 8],
//    [4, 7, 2],
//    [3, 9, 6]
// ];
// var newMatrix = transpose(matrix);
// // [1, 4, 3],
// // [5, 7, 9],
// // [8, 2, 6]

// elog(newMatrix, [[1, 4, 3], [5, 7, 9], [8, 2, 6]]);
// p();
// elog(matrix,    [[1, 5, 8], [4, 7, 2], [3, 9, 6]]);














// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============== Transpose MxN ============//


// const transpose = arr => arr[0].map((_, i) => arr.map(a => a[i]));


// elog(transpose([[1, 2, 3, 4]]),       [[1], [2], [3], [4]]);
// elog(transpose([[1], [2], [3], [4]]), [[1, 2, 3, 4]]);
// elog(transpose([[1]]),                [[1]]);
// elog(transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]),
//                [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]);













// ---------------- 4 -----------------console.log('\n--------- 4 ----------');
// //============== Rotating Matrices ============//


// // const rotate90 = arr => (
// //   arr[0].map((_, i) => [...arr].reverse().map(a => a[i]))
// // );


// const rotate90 = arr => arr[0].map((_, i) => arr.map(a => a[i]).reverse());


// var matrix1 = [
//   [1, 5, 8],
//   [4, 7, 2],
//   [3, 9, 6]
// ];

// var matrix2 = [
//   [3, 7, 4, 2],
//   [5, 1, 0, 8]
// ];

// var newMatrix1 = rotate90(matrix1);
// var newMatrix2 = rotate90(matrix2);
// var newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

// elog(newMatrix1, [[3, 4, 1],
//                   [9, 7, 5],
//                   [6, 2, 8]]);
// p();
// elog(newMatrix2, [[5, 3],
//                   [1, 7],
//                   [0, 4],
//                   [8, 2]]);
// p();
// elog(newMatrix3, matrix2);












// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============== Merge Sorted Lists ============//

// const merge = (a, b) => {
//   let result = [];

//   for (var i = 0, j = 0; i < a.length && j < b.length; ) {
//     a[i] <= b[j] ? result.push(a[i++]) : result.push(b[j++]);
//   }

//   return [...result, ...b.slice(j), ...a.slice(i)];
// };



// const merge = (a, b) => {
//   if (a.length === 0) return [...b];
//   else if (b.length === 0) return [...a];

//   return a[0] < b[0] ? [a[0], ...merge(a.slice(1), b)] : [b[0], ...merge(a, b.slice(1))]
// };



// const merge = (a, b) => {
//   if (!a.length || !b.length) return [...a, ...b];
//   return a[0] < b[0] ? [a[0], ...merge(a.slice(1), b)] : [b[0], ...merge(a, b.slice(1))]
// };


// elog(merge([1, 5, 9], [2, 6, 8]), [1, 2, 5, 6, 8, 9]);
// elog(merge([1, 1, 3], [2, 2]),    [1, 1, 2, 2, 3]);
// elog(merge([], [1, 4, 5]),        [1, 4, 5]);
// elog(merge([1, 4, 5], []),        [1, 4, 5]);
// elog(merge([], []),               []);
// elog(merge([0, 3], [1]),          [0, 1, 3]);











// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============== Merge Sort ============//

// // FIX.............................:
// // const mergeSort = arr => {
// //   if (countNonArrayElems(arr) === 0) return [];
// //   let half = ~~(arr.length / 2);
// //   // return [...mergeSort([arr.slice(0, half), arr.slice(half)])];
// //   // return [mergeSort(p(arr.slice(0, half))), mergeSort(arr.slice(half))]
// // };

// // const countNonArrayElems = arr => arr.filter(x => !Array.isArray(x)).length;



// // const mergeSort = arr => {
// //   let divided = divide(arr);
// //   return divided;
// // };
// // const divide = arr => {
// //   if (arr.length <= 1) return arr;
// //   let half = ~~(arr.length / 2);
// //   // return [divide(arr.slice(0, half)), divide(arr.slice(half))];
// //   return merge(divide(arr.slice(0, half)), divide(arr.slice(half)));
// // };

// const merge = (a, b) => {
//   if (!a.length || !b.length) return [...a, ...b];
//   return a[0] < b[0] ? [a[0], ...merge(a.slice(1), b)] : [b[0], ...merge(a, b.slice(1))]
// };

// const mergeSort = (arr, half = ~~(arr.length / 2)) => (
//   half ? merge(mergeSort(arr.slice(0, half)), mergeSort(arr.slice(half))) : arr
// );



// elog(mergeSort([9, 5, 7, 1]),    [1, 5, 7, 9]);
// p();

// elog(mergeSort([5, 3]),          [3, 5]);
// p();

// elog(mergeSort([6, 2, 7, 1, 4]), [1, 2, 4, 6, 7]);
// p();

// elog(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']),
//                ['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler']);
// p();

// elog(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]),
//                [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]);
// p();










// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============== Binary Search ============//

// FIX -1................................:
// const binarySearch = (arr, val) => {
//   let half = ~~(arr.length / 2);
//   if (arr[half] === val) return half;
//   else if (arr.length <= 1) return -1;
//   else if (arr[half] < val) return half + 1 + binarySearch(arr.slice(half + 1), val);
//   else if (arr[half] > val) return binarySearch(arr.slice(0, half), val);
// };


const binarySearch = (arr, val, n = 0, half = ~~(arr.length / 2)) => (
  arr[half] === val
    ? half + n
    : !half
      ? -1
      : arr[half] < val
        ? binarySearch(arr.slice(half + 1), val, n + half + 1)
        : binarySearch(arr.slice(0, half),  val, n)
);



// const binarySearch = (arr, val, n = 0, half = ~~(arr.length / 2)) => (
//   arr[half] === val ? half + n : !half && -1 || (arr[half] < val
//     ? binarySearch(arr.slice(half + 1), val, n + half + 1)
//     : binarySearch(arr.slice(0, half),  val, n))
// );



elog(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77),                                -1);
p();
elog(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89),                                7);
p();
elog(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 23),                                4);
p();
elog(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5),                                 1);
p();
elog(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter'), -1);
p();
elog(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler'), 6);
p();

elog(binarySearch([1, 2, 3, 4, 5, 6], 1), 0);
elog(binarySearch([1, 2, 3, 4, 5, 6], 2), 1);
elog(binarySearch([1, 2, 3, 4, 5, 6], 3), 2);
elog(binarySearch([1, 2, 3, 4, 5, 6], 4), 3);
elog(binarySearch([1, 2, 3, 4, 5, 6], 5), 4);
elog(binarySearch([1, 2, 3, 4, 5, 6], 6), 5);
elog(binarySearch([1, 2, 3, 4, 5, 6], 7), -1);
elog(binarySearch([1, 2, 3, 4, 5, 6], 0), -1);
