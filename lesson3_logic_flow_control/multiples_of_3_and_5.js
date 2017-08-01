function multiplesOfThreeAndFive() {
  for (var i = 3; i <= 100; i++) {
    if      (i % 3 === 0 && i % 5 === 0) console.log(String(i) + '!');
    else if (i % 3 === 0 || i % 5 == 0)  console.log(String(i));
  }
}

multiplesOfThreeAndFive();
// output on console:
// 3
// 5
// 6
// 9
// 10
// 12
// 15!
// ... remainder of output omitted for brevity


// FE:

function multiples(start, end) {
  for (var i = start; i <= end; i++) {
    if      (i % 3 === 0 && i % 5 === 0) console.log(String(i) + '!');
    else if (i % 3 === 0 || i % 5 == 0)  console.log(String(i));
  }
}

multiples(10, 40)