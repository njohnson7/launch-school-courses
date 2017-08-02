/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');

function slice(arr, start, end) {
  var result = [];
  for (var i = start, j = 0; i < end; i++, j++) {
    result[j] = arr[i];
  }

  return result;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2));                         // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));     // [ 'b', 'c' ]





/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');

function splice(arr, start, n) {
  var spliced = [];
  var len = arr.length;
  var max = len - start;
  n = n > max ? max : n;
  var numToRight = len - start - n;

  for (var i = start, j = 0; j < n; i++, j++) {
    spliced[j] = arr[i];
  }

  for (i = start, j = 0; j < numToRight; i++, j++) {
    arr[i] = arr[i + n];
  }

  arr.length = arr.length - n;
  return spliced;
}

var count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));        // [ 3, 4, 5, 6, 7 ]
console.log(count);                      // [ 1, 2, 8]
console.log('\n=====');

var nums = [5, 10, 20, 13, 12, 14, 26]
var nums = [5, 10, 20, 13, 12, 14, 26]
console.log(splice(nums, 0, 0));         // []
console.log(nums);                       // [ 5, 10, 20, 13, 12, 14, 26 ]
console.log('\n=====');

var nums = [5, 10, 20, 13, 12, 14, 26]
console.log(splice(nums, 0, 3));         // [ 5, 10, 20 ]
console.log(nums);                       // [ 13, 12, 14, 26 ]
console.log('\n=====');

var nums = [5, 10, 20, 13, 12, 14, 26]
console.log(splice(nums, 1, 3));         // [ 10, 20, 13 ]
console.log(nums);                       // [ 5, 12, 14, 26 ]
console.log('\n=====');

var nums = [5, 10, 20, 13, 12, 14, 26]
console.log(splice(nums, 5, 3));         // [ 14, 26 ]
console.log(nums);                       // [ 5, 10, 20, 13, 12 ]
console.log('\n=====');

var nums = [5, 10, 20, 13, 12, 14, 26]
console.log(splice(nums, 2, 1));         // [ 20 ]
console.log(nums);                       // [ 5, 10, 13, 12, 14, 26]
console.log('\n=====');

var nums = [5, 10, 20, 13, 12, 14, 26]
console.log(splice(nums, 2, 7));         // [ 20, 13, 12, 14, 26 ]
console.log(nums);                       // [ 5, 10 ]
console.log('\n=====');





/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');

function concat(arr1, arr2) {
  var result = [];
  for (var i = 0; i < arr1.length; i++) {
    result[i] = arr1[i];
  }

  for (var j = i, i = 0; i < arr2.length; i++, j++) {
    result[j] = arr2[i];

  }

  return result;
}

console.log(concat([1, 2, 3], [4, 5, 6]));            // [ 1, 2, 3, 4, 5, 6 ]
console.log(concat([1, 2, 3], [4, 5, 6, 7, 8, 9]));   // [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
console.log(concat([1, 2, 3, -1, -2], [4, 5, 6, 7])); // [ 1, 2, 3, -1, -2, 4, 5, 6, 7]





/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');

function join(arr, str) {
  var result = '';
  for (var i = 0; i < arr.length; i++) {
    result += String(arr[i]);
    if (i === arr.length - 1) break;
    result += str;
  }

  return result;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'
