/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');

function indexOf(arr, value) {
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] === value) return i;
  }

  return -1;
}

console.log(indexOf([1, 2, 3, 3], 3));        // 2
console.log(indexOf([1, 2, 3], 4));           // -1




/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');

function lastIndexOf(arr, value) {
  for (var i = arr.length - 1; i >= 0; i--) {
    if (arr[i] === value) return i;
  }

  return -1;
}


console.log(lastIndexOf([1, 2, 3, 3], 3));    // 3
console.log(lastIndexOf([1, 2, 3], 4));       // -1

// arr.indexOf(searchElement[, fromIndex]):
var a = [2, 9, 9];
a.indexOf(2); // 0
a.indexOf(7); // -1
if (a.indexOf(7) === -1) {
  // element doesn't exist in array
}
var arr = [2, 9, 9];
arr.indexOf(2);     // 0
arr.indexOf(7);     // -1
arr.indexOf(9, 2);  // 2
arr.indexOf(2, -1); // -1
// negative index are offset from end:
arr.indexOf(2, -3); // 0

// arr.lastIndexOf(searchElement, fromIndex):
var arr = [2, 5, 9, 2];
arr.lastIndexOf(2);     // 3
arr.lastIndexOf(7);     // -1
arr.lastIndexOf(2, 3);  // 3
arr.lastIndexOf(2, 2);  // 0
arr.lastIndexOf(2, -2); // 0
arr.lastIndexOf(2, -1); // 3



