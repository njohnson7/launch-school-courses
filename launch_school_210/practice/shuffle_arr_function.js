const eql = (a, b) => JSON.stringify(a) === JSON.stringify(b);


const p = (...args) => console.log(...args);


const shuffle = origArr => {   // https://stackoverflow.com/a/42965222
  let arr = [...origArr];
  let currentIdx = arr.length;

  while (currentIdx !== 0) {
    let randomIdx = ~~(Math.random() * currentIdx--);
    [arr[currentIdx], arr[randomIdx]] = [arr[randomIdx], arr[currentIdx]];
  }

  return arr;
};




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
