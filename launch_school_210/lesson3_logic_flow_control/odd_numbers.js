function logOddNumbers(num) {
  for (var i = 1; i <= num; i++) {
    if (i % 2 === 0) continue;
    console.log(i);
  }
}

// FE:
function logOddNumbers(num) {
  for (var i = 1; i <= num; i += 2) {
    console.log(i);
  }
}

logOddNumbers(19);

// output on console:
// 1
// 3
// 5
// 7
// 9
// 11
// 13
// 15
// 17
// 19
