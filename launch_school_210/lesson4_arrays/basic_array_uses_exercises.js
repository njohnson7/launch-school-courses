/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');

function firstElementOf(arr) {
  return arr[0];
}

console.log(firstElementOf(['U', 'S', 'A'])); // Returns "U"






/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');

function lastElementOf(arr) {
  return arr[arr.length - 1];
}

console.log(lastElementOf(['U', 'S', 'A'])); // Returns "A"







/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');

function nthElementOf(arr, index) {
  return arr[index];
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(nthElementOf(digits, 3));  // Returns 16
console.log(nthElementOf(digits, 8));  // What does this return?
console.log(nthElementOf(digits, -1)); // What does this return?








/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');

// yes

var digits = [4, 8, 15, 16, 23, 42];
console.log(digits.length);
console.log(digits[-1] = -42);
console.log(digits.length);
console.log(nthElementOf(digits, -1));
console.log(digits[-1]);
console.log(digits['-1']);






/*---------------- 5 ----------------*/ console.log('\n\n-------- 5 ---------');

function firstNOf(arr, count) {
  return arr.slice(0, count);
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3));    // Returns [4, 8, 15]







/*---------------- 6 ----------------*/ console.log('\n\n-------- 6 ---------');

function lastNOf(arr, count) {
  return arr.slice(-count);
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3)); // Returns [16, 23, 42]







/*---------------- 7 ----------------*/ console.log('\n\n-------- 7 ---------');

function lastNOf(arr, count) {
  return arr.slice(-count);
}

var arr = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 8));  // Returns [4, 8, 15, 16, 23, 42]
console.log(lastNOf(digits, 20));







/*---------------- 8 ----------------*/ console.log('\n\n-------- 8 ---------');

function endsOf(arr1, arr2) {
  return [arr1[0], arr2[arr2.length - 1]]
}

console.log(endsOf([4, 8, 15], [16, 23, 42])); // Returns [4, 42]
