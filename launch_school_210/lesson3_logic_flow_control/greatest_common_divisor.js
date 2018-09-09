function gcd(a, b) {
  var n = a < b ? a : b;
  for (; n >= 1; n--) {
    if (a % n === 0 && b % n === 0) return n;
  }
}

// Euclids algorithm:
function gcd(a, b) {
  var small = a < b ? a : b;
  var big = a < b ? b : a;
  while (true) {
    num = Math.floor(big / small);
    rem = big % small;
    if (rem === 0) return small;
    big = small;
    small = rem;
  }
}

function gcd(num1, num2) {
  while(num2 !== 0) {
    var temp = num2;
    num2 = num1 % num2;
    num1 = temp;
  }

  return num1;
}

console.log(gcd(12, 4));   // 4
console.log(gcd(4, 12));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(10, 15));  // 5
console.log(gcd(9, 2));    // 1
console.log(gcd(2, 9));    // 1

console.log('\n\n=======');


// FE:
function gcd_arr(nums) {
  var num1 = nums[0]
  for (var i = 1; i < nums.length; i++) {
    var num2 = nums[i];
    num1 = gcd(num1, num2);
  }

  return num1;
}

console.log(gcd_arr([12, 4]));
console.log(gcd_arr([12, 4, 1]));
console.log(gcd_arr([12, 4, 32]));
console.log(gcd_arr([10, 15, 50, 42]));
console.log(gcd_arr([27, 15, 3]));
console.log(gcd_arr([12, 4, 8]));
