function missing(arr) {
  var nums = [];
  var result = [];

  for (var i = arr[0] + 1; i < arr[arr.length - 1]; i++) {
    nums.push(i);
  }

  for (i = 0; i < nums.length; i++) {
    if (arr.indexOf(nums[i]) === -1) result.push(nums[i]);
  }

  return result;
}

// alternate:
function missing(arr) {
  var result = [];
  for (var i = arr[0] + 1; i < arr[arr.length - 1]; i++) {
    if (!arr.includes(i)) result.push(i);
  }

  return result;
}


console.log(missing([-3, -2, 1, 5])); // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));   // []
console.log(missing([1, 5]));         // [2, 3, 4]
console.log(missing([6]));            // []
