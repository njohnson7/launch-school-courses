/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');

function oddElementsOf(arr) {
  var result = [];
  for (var i = 1; i < arr.length; i += 2) {
    result.push(arr[i]);
  }

  return result;
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits)); // Returns [8, 16, 42]







/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');

function combinedArray(even, odd) {
  var result = [];
  for (var i = 0; i < even.length; i++) {
    result.push(even[i], odd[i])
  }

  return result;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

console.log(combinedArray(digits, letters));
// [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]








/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');

// function mirror(arr) {
//   var result = [];
//   for (var i = arr.length - 1; i >= 0; i--) {
//     result.unshift(arr[i]);
//     result.push(arr[i]);
//   }

//   return result;
// }

function mirror(arr) {
  return arr.concat(arr.slice().reverse());
}

console.log(mirror([1,2,3])); // [1, 2, 3, 3, 2, 1]
console.log(mirror(['a', 'b', 1, 4, 'x'])); // [a b 1 4 x x 4 1 b a]







/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');

function sortDescending(arr) {
  return arr.slice().sort(function(a, b) { return b - a; });
}

var arr = [23, 4, 16, 42, 8, 15];
var result = sortDescending(arr);
console.log(result);   // [42, 23, 16, 15, 8, 4]
console.log(arr);        // [23, 4, 16, 42, 8, 15])










/*---------------- 5 ----------------*/ console.log('\n\n-------- 5 ---------');

function matrixSums(arr) {
  var result = [];
  var subArr;
  for (var i = 0; i < arr.length; i++) {
    subArr = arr[i];
    for (var j = 0, sum = 0; j < subArr.length; j++) {
      sum += subArr[j];
    }

    result.push(sum);
  }

  return result;
}

function matrixSums(arr) {
  var result = [];
  for (var i = 0; i < arr.length; i++) {
    sum = arr[i].reduce(function(s, value) { return s + value; }, 0);
    result.push(sum);
  }

  return result;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]])); // [15, 60, 12]








/*---------------- 6 ----------------*/ console.log('\n\n-------- 6 ---------');

function uniqueElements(arr) {
  var result = [];
  for (var i = 0; i < arr.length; i++) {
    if (result.includes(arr[i])) continue;
    result.push(arr[i]);
  }

  return result;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4])); // [1, 2, 4, 3, 5]
