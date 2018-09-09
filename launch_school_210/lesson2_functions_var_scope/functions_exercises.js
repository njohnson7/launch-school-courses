/*----------------- 1 -------------------*/ console.log('-------- 1 ---------');
function average(a, b, c) {
  return sum(a, b, c) / 3;
}

console.log(average(1, 2, 3));
console.log(average(1, 1, 2));
console.log(average(3, 5, 8));






/*---------------- 2 ----------------*/ console.log('\n\n-------- 2 ---------');
function sum(a, b, c) {
  return a + b + c;
}

console.log(sum(3, 5, 8));






/*---------------- 3 ----------------*/ console.log('\n\n-------- 3 ---------');
function sum2(nums) {
  var total = 0;
  for (var i = 0; i < nums.length; i++) {
    total += nums[i];
  }
  return total;
}

function avg2(nums) {
  return sum2(nums) / nums.length;
}

console.log(sum2([3, 5, 8]));
console.log(sum2([3, 5, 8, 10]));
console.log(avg2([3, 5, 8]));
console.log(avg2([3, 5, 8, 10]));
console.log(avg2([1, 3]));
console.log(avg2([1]));
console.log(avg2([3, 5, 8, 10, 20]));

function sum3(nums) {
  var total = 0;
  for (var num of nums) {
    total += num;
  }
  return total;
}

console.log(sum3([3, 5, 8]));


function avg3(nums) {
  var total = 0;
  for (var i = 0, len = nums.length; i < len; i++) {
    total += nums[i];
  }
  return total / len;
}

console.log('=====');
console.log(avg3([3, 5, 8]));






/*---------------- 4 ----------------*/ console.log('\n\n-------- 4 ---------');
function sum4(nums) {
  var total = 0;
  for (var i = 0, len = nums.length; i < len; i++) {
    total += nums[i];
  }
  return total;
}

function avg4(nums) {
  return sum4(nums) / nums.length;
}

console.log(avg4([3, 5, 8]));
console.log(avg4([3, 5, 8, 10, 20]));
console.log(avg4([3, 3, 8, 3, 3]));







/*---------------- 5 ----------------*/ console.log('\n\n-------- 5 ---------');
var temperatures = [90, 95, 105, 100, 102];
console.log(avg4(temperatures));
