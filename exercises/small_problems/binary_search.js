// go to half of the data (ex: 'eat a lot')
// if value at half:
  // === 'Pizzeria', stop the search
  // if < 'Pizzeria' =>
    // discard lower half from (0..half)
    // repeat process from top, using upper half (half + 1..-1)
  // if > 'Pizzeria' => do same as above, but with opposite halves
// half == (arr.length / 2).ceil - 1

function binarySearch(arr, value, num = 0) {
  var half = Math.ceil(arr.length / 2) - 1;
  // var half = Math.ceil(arr.length / 2) - 1;
  // console.log(half);

  if (arr[half] === value) return half + num;
  if (arr.length <= 1) return -1;

  if (arr[half] < value) {
    var sliced = arr.slice(half + 1);
    // return binarySearch(arr.slice(half + 1), value, half + num + 1);
    return binarySearch(arr.slice(half + 1), value, num + half + 1);
  } else if (arr[half] > value) {
    var sliced = arr.slice(0, half);
    return binarySearch(arr.slice(0, half), value, num);
  }
}

function binarySearch(arr, value, num = 0) {
  var half = Math.ceil(arr.length / 2) - 1;

  if (arr[half] === value) return half + num;
  if (arr.length <= 1) return -1;

  if (arr[half] < value) {
    return binarySearch(arr.slice(half + 1), value, num + half + 1);
  } else {
    return binarySearch(arr.slice(0, half), value, num);
  }
}


//Yellow pages list of businesses data:
var yellowPages = ['Apple Store', 'Bags Galor', 'Bike Store',
  'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta place',
  'Pizzeria', 'Ruby Lounge', 'Zooper'];

console.log(binarySearch(yellowPages, 'Pizzeria'));  // 7
console.log('~~~~');

console.log(binarySearch([1, 2, 3, 4, 5], 1));       // 0
console.log(binarySearch([1, 2, 3, 4, 5], 2));       // 1
console.log(binarySearch([1, 2, 3, 4, 5], 3));       // 2
console.log(binarySearch([1, 2, 3, 4, 5], 4));       // 3
console.log(binarySearch([1, 2, 3, 4, 5], 5));       // 4
console.log('~~~~');

console.log(binarySearch([1, 2, 3, 4, 5, 6], 1));    // 0
console.log(binarySearch([1, 2, 3, 4, 5, 6], 2));    // 1
console.log(binarySearch([1, 2, 3, 4, 5, 6], 3));    // 2
console.log(binarySearch([1, 2, 3, 4, 5, 6], 4));    // 3
console.log(binarySearch([1, 2, 3, 4, 5, 6], 5));    // 4
console.log(binarySearch([1, 2, 3, 4, 5, 6], 6));    // 5
console.log('~~~~');

console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77)); // -1
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89)); // 7
console.log('~~~~');

console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter'));
// -1
console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler'));
// 6
