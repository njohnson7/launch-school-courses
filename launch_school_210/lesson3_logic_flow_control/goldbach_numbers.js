/*
  - get list of all primes from 2..num
  - iterate over each prime
    - for each, iterate over primes in reverse, adding them together
      - if sum > num, move down in 2nd list
      - else if sum <= num: move up to next num in first list
        - if they sum to num, log pair
    - if current prime in first list > current in 2nd list, return
*/

function isPrime(num) {
  if (num <= 1 || (num > 2 && num % 2 === 0)) return false;
  for (var i = 3; i < num; i += 2) {
    if (num % i === 0) return false;
  }

  return true;
}

function findPrimes(max) {
  for (var i = 2, primes = []; i <= max; i++) {
    if (isPrime(i)) primes.push(i);
  }

  return primes;
}

function checkGoldbach(num) {
  if (num < 4 || num % 2 === 1) {
    console.log(null);
    return;
  }

  var primes = findPrimes(num - 2);
  var reversePrimes = findPrimes(num - 2).reverse();
  for (var i = 0; i < primes.length; i++) {
    var prime1 = primes[i];

    for (var j = 0; j < reversePrimes.length; j++) {
      var prime2 = reversePrimes[j];
      if (prime1 > prime2) return;
      var sum = prime1 + prime2;
      if (sum === num) console.log(String(prime1) + ' ' + String(prime2));
      if (sum <= num) break;
    }

  }
}


// alternate:
function sumPairs(num) {
  var half = num / 2;
  var pairs = [];
  for (var i = 2; i <= half; i++) {
    for (var j = num - 2; j >= half; j--) {
      if (i + j === num) pairs.push([i, j])
    }
  }

  return pairs;
}

function checkGoldbach(num) {
  if (num < 4 || num % 2 === 1) {
    console.log(null);
    return;
  }

  pairs = sumPairs(num);
  for (var i = 0; i < pairs.length; i++) {
    var a = pairs[i][0];
    var b = pairs[i][1];
    if (isPrime(a) && isPrime(b)) console.log(String(a) + ' ' + String(b));
  }
}


// alternate2:
function checkGoldbach(num) {
  if (num < 4 || num % 2 === 1) {
    console.log(null);
    return;
  }

  for (var i = 2, j = num - 2; i <= j; i++, j--) {
    if (isPrime(i) && isPrime(j)) console.log(String(i) + ' ' + String(j));
  }
}



checkGoldbach(3);  // null
checkGoldbach(5);  // null
checkGoldbach(4);  // 2 2
checkGoldbach(12); // 5 7
checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
