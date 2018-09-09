/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');

function lastInArray(arr) {
  return arr[arr.length - 1];
}

console.log(lastInArray([1, 2, 3]));
console.log(lastInArray(['a', 'b', 'c', 'd']));
console.log(lastInArray(['a', 'b', 'c', 'd', 5, 6]));







/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');

function rollCall(names) {
  for (var i = 0; i < names.length; i++) {
    console.log(names[i]);
  }
}

rollCall([])
rollCall(['bob', 'fred', 'jim'])
console.log('=====');
rollCall(['bob', 'fred', 'jim', 'eric', 'jones'])








/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');

function reverse(arr) {
  var result = [];
  for (var i = arr.length - 1; i >= 0; i--) {
    result.push(arr[i]);
  }

  return result;
}

console.log(reverse([1, 2, 3]));
console.log(reverse([1, 2, 3, 5, 9, 7, -3]));








/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');

function findIndex(arr, value) {
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] === value) return i;
  }

  return -1;
}

console.log(findIndex([1, 2, 3, 4, 5], 4));
console.log(findIndex([1, 2, 3, 4, 5], 7));
console.log(findIndex(['a', 'b', 'c', 'd', 'e'], 'a'));
console.log(findIndex(['a', 'b', 'c', 'd', 'e'], 'b'));
console.log(findIndex(['a', 'b', 'c', 'd', 'e'], 'c'));
console.log(findIndex(['a', 'b', 'c', 'd', 'e'], 'd'));
console.log(findIndex(['a', 'b', 'c', 'd', 'e'], 'e'));






/*---------------- 5 ----------------*/ console.log('\n\n-------- 5 ---------');

function join(arr) {
  var str = '';
  for (var i = 0; i < arr.length; i++) {
    str += String(arr[i]);
  }

  return str;
}

console.log(join([1, 'a', 4]));
console.log(join([1, 'a', 4, 10, 15, 'x']));
