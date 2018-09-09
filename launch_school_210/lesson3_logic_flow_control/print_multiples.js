function logMultiples(num) {
  for (var i = 100; i >= num; i--) {
    if (i % 2 === 1 && i % num === 0) console.log(i);
  }
}

// FE:
function logMultiples(num) {
  var max = 0;
  var current = 100;
  while (max === 0) {
    current--;
    if (current % num === 0) max = current;
  }
  while (current >= num) {
    if (current % 2 === 1) console.log(current);
    current -= num;
  }
}

function logMultiples(num) {
  var multiple = Math.floor(100 / num);
  var current = multiple * num;
  for (; current >= num; current -= num) {
    if (current % 2 === 1) console.log(current);
  }
}

function logMultiples(num) {
  for (var multiple = Math.floor(100 / num) * num; multiple >= num; multiple -= num) {
    if (multiple % 2 === 1) console.log(multiple);
  }
}

logMultiples(17);
// output (5x, 3x and 1x):
// 85
// 51
// 17
console.log('\n-----');

logMultiples(21);
// output (3x and 1x):
// 63
// 21
