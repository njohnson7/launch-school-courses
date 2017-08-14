// const diamond = num => {
//   let seq = [...Array(Math.ceil(num / 2))].map((_, i) => 2 * i + 1);

//   seq = [...seq, ...seq.slice().reverse().slice(1)];

//   seq.forEach(n => console.log(' '.repeat((num - n) / 2) + '*'.repeat(n)));
// }


const diamond = num => {
  let seq = [...Array(Math.ceil(num / 2))].map((_, i) => 2 * i + 1);
  [...seq, ...seq.slice().reverse().slice(1)]
    .forEach(n => console.log(' '.repeat((num - n) / 2) + '*'.repeat(n)));
}


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
