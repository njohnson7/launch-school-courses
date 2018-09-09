function isPrime(num) {
  for (var i = 2; i < num; i++) {
    if (num % i === 0) return false;
  }
  return num > 1;
}

function isPrime(num) {
  for (var i = 2; i < num; i++) if (num % i === 0) return false;
  return num > 1;
}

// FE:
function isPrime(num) {
  if (num <= 1 || (num > 2 && num % 2 === 0)) return false;
  for (var i = 3; i < num; i += 2) {
    if (num % i === 0) return false;
  }
  return true;
}

console.log(isPrime(1));  // false
console.log(isPrime(2));  // true
console.log(isPrime(3));  // true
console.log(isPrime(43)); // true
console.log(isPrime(55)); // false
console.log(isPrime(0));  // false
