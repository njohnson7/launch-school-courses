// const diamond = num => {
//   let seq = [...Array(Math.ceil(num / 2))].map((_, i) => 2 * i + 1);

//   seq = [...seq, ...seq.slice().reverse().slice(1)];

//   seq.forEach(n => console.log(' '.repeat((num - n) / 2) + '*'.repeat(n)));
// };


// const diamond = num => {
//   let seq = [...Array(Math.ceil(num / 2))].map((_, i) => 2 * i + 1);
//   [...seq, ...seq.slice().reverse().slice(1)]
//     .forEach(n => console.log(' '.repeat((num - n) / 2) + '*'.repeat(n)));
// };


// const diamond = n => {
//   [...[...Array(n + 1).keys()], ...[...Array(n).keys()].reverse()]
//     .forEach(i => i % 2 && console.log(`${' '.repeat((n - i) / 2)}${'*'.repeat(i)}`));
// };


// const diamond = n => {
//   [...[...Array(n + 1).keys()], ...[...Array(n).keys()].reverse()]
//     .forEach(i => i % 2 && console.log(`${'*'.repeat(i).padStart((n +i + 1 ) / 2)}`));
// };



// // FE:

// const diamond = n => {
//   [...[...Array(n + 1).keys()], ...[...Array(n).keys()].reverse()]
//     .forEach(i => i % 2 && console.log(`${' '.repeat((n - i) / 2)}\
// ${'*'.repeat(i).replace(/\*(\*)+\*/, x => `*${' '.repeat(x.length - 2)}*`)}`));
// };


const diamond = n => {
  [...[...Array(n + 1).keys()], ...[...Array(n).keys()].reverse()]
    .forEach(i => i % 2 && console.log(`${'*'.repeat(i).padStart((n +i + 1 ) / 2)
      .replace(/\*(\*)+\*/, x => `*${' '.repeat(x.length - 2)}*`)}`));
};

diamond(1);
// *

diamond(3);
//  *
// ***
//  *

diamond(9);
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *
