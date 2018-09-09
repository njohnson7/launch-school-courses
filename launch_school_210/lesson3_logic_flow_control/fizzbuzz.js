function fizzbuzz(min, max) {
  for (var i = min; i <= max; i++) {
    if      (i % 15 === 0) console.log('FizzBuzz');
    else if (i % 3 === 0)  console.log('Fizz');
    else if (i % 5 === 0)  console.log('Buzz');
    else                   console.log(String(i));
  }
}

// FE:
function fizzbuzz(min, max) {
  for (var i = min, msg; i <= max; i++, msg = '') {
    if (i % 3 === 0) msg = 'Fizz';
    if (i % 5 === 0) msg += 'Buzz';
    console.log(msg || i);
  }
}

fizzbuzz(1, 100);

// console output
// 1
// 2
// Fizz
// 4
// Buzz
// Fizz
// 7
// 8
// Fizz
// Buzz
// 11
// Fizz
// 13
// 14
// FizzBuzz
// 16
// 17
// Fizz
//... rest of output omitted for brevity
