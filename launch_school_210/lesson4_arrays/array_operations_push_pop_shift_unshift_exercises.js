/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');

function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

var count = [1, 2, 3];
console.log(push(count, 4));  // 4
console.log(count);           // [1, 2, 3, 4]
console.log(count.push(20));
console.log(count);





/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');

function pop(arr) {
  var newLength = arr.length - 1;
  var lastElem = arr[newLength];
  arr.length = newLength;
  return lastElem;
}

var count = [1, 2, 3];
console.log(pop(count));           // 3
console.log(count);                // [ 1, 2 ]






/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');

function unshift(arr, value) {
  for (var i = arr.length; i >= 0; i--) {
    arr[i] = arr[i - 1];
  }

  arr[0] = value;
  return arr.length;
}


var count = [1, 2, 3];
console.log(unshift(count, 0));        // 4
console.log(count);                    // [ 0, 1, 2, 3 ]





/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');

function shift(arr) {
  var firstElem = arr[0];
  var newLength = arr.length - 1;
  for (var i = 0; i < newLength; i++) {
    arr[i] = arr[i + 1];
  }

  arr.length = newLength;
  return firstElem;
}


var count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]

var a = [92,1,2,3,4,5,6,20,30]
console.log(shift(a));
console.log(a);
