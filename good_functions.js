// Equality function:
//   Converts each argument to a string, then determines if they are equal.
//   This allows comparison of arrays, which can be useful for exercise test cases.
const eql = (a, b) => {
  return JSON.stringify(a) === JSON.stringify(b);
};

// Equality-Logger: logs both objects, and returns true if equal.
const elog = (a, b) => {
  p('a  => ', a);     // logs each argument using the `p` function, with a readable notation.
  p('b  => ', b);
  return p('|___________', eql(a, b), '___________|')[1]; // logs and returns the return value of `eql`
};

// p - combination of `console.log` and Ruby's `Kernel#p`:
const p = (...args) => {
  args.length > 0
       ? console.log(...args) // logs 1+ comma separated arguments - ex: console.log(1, 'a', [])
       : console.log('');     // logs a blank line if no arguments.

  return args.length === 0
         ? undefined          // returns undefined if no arguments passed.
         : args.length === 1
           ? args[0]          // returns single argument's value if one argument.
           : args;            // returns all args as an array if 2+ arguments.
};


const shuffle = origArr => {   // https://stackoverflow.com/a/42965222
  let arr = [...origArr];
  let currentIdx = arr.length;

  while (currentIdx !== 0) {
    let randomIdx = ~~(Math.random() * currentIdx--);
    [arr[currentIdx], arr[randomIdx]] = [arr[randomIdx], arr[currentIdx]];
  }

  return arr;
};


const sample = arr => arr[~~(Math.random() * arr.length)];


// let numz = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
// let numz2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 19, 4, 2, 1, 9, 3, 11, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

// console.log(shuffle(numz));
// console.log(shuffle(numz));
// console.log(!eql(shuffle(numz), shuffle(numz)));
// console.log(!eql(shuffle(numz), numz));
// console.log(JSON.stringify(numz) === JSON.stringify([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// console.log(eql(numz, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));

// console.log('=========');

// console.log(shuffle(numz2));
// console.log(shuffle(numz2));
// console.log(!eql(shuffle(numz2), shuffle(numz2)));
// console.log(!eql(shuffle(numz2), numz2));
// console.log(JSON.stringify(numz2) === JSON.stringify( [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 19, 4, 2, 1, 9, 3, 11, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// console.log(eql(numz2, [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 19, 4, 2, 1, 9, 3, 11, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
