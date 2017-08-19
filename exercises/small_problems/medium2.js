// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //================== Lettercase Percentage Ratio ====================//

// const letterPercentages = str => ( {
//   lowercase: p(str.replace(/[^a-z]/g, '').length / str.length * 100),
//   uppercase: p(str.replace(/[^A-Z]/g, '').length / str.length * 100),
//   neither:   p(str.replace(/[a-z]/gi, '').length / str.length * 100),
// });



// FIXXXXXXXX..................................
// const letterPercentages = (str, [l, u, n] = [0, 0, 0], c = str[0]) => {
//   if (!c) return {lowercase: l, u, n};

//   return letterPercentages(str.slice(1),
//     [[l, /[a-z]/], [u, /[A-Z]/], [n, /[^a-z]/i]].map(([t, r]) => t + r.test(c)));
// };




// const letterPercentages = str => (
//   [['lowercase', /[^a-z]/g], ['uppercase', /[^A-Z]/g], ['neither', /[a-z]/gi]]
//     .reduce((counts, [type, pat]) => (
//       { ...counts, [type]: str.replace(pat, '').length / str.length * 100 }), {})
// );

// elog(letterPercentages('abCdef 123'), { lowercase: 50.00, uppercase: 10.00, neither: 40.00 });
// elog(letterPercentages('AbCd +Ef')  , { lowercase: 37.50, uppercase: 37.50, neither: 25.00 });
// elog(letterPercentages('123')       , { lowercase: 0.00,  uppercase: 0.00,  neither: 100.00 });









// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //================== Triangle Sides ====================//



// // const triangle = (...sides) => (
// //   ['invalid', 'equilateral', 'isosceles', 'scalene']
// //     [+(sides.sort((a, b) => a - b)[1] + Math.min(...sides) > Math.max(...sides) &&
// //       sides.every(side => side > 0)) && new Set(sides).size]
// // );




// // const triangle = (...sides) => (
// //   ['invalid', 'equilateral', 'isosceles', 'scalene']
// //     [+(sides.sort((a, b) => a - b)[1] + Math.min(...sides) > Math.max(...sides) &&
// //       Math.min(...sides) > 0) && new Set(sides).size]
// // );



// // const triangle = (...sides) => (
// //   ['invalid', 'equilateral', 'isosceles', 'scalene']
// //     [+(sides.sort((a, b) => a - b)
// //       .every((min, _, s) => min > 0 && min + s[1] > s[2])) && new Set(sides).size]
// // );


// const triangle = (...sides) => (
//   ['invalid', 'equilateral', 'isosceles', 'scalene'][+(sides.sort((a, b) => a - b)
//     .every((a, _, [, b, c]) => a > 0 && a + b > c)) && new Set(sides).size]
// );



// const triangle = (a, b, c, sides = [a, b, c].sort((x, y) => x - y)) => (
//   ['invalid', 'equilateral', 'isosceles', 'scalene']
//     [+(sides.every((a, _, [, b, c]) => a > 0 && a + b > c)) && new Set(sides).size]
// );



// elog(triangle(3, 3, 3)  , 'equilateral');
// elog(triangle(3, 3, 1.5), 'isosceles');
// elog(triangle(3, 4, 5)  , 'scalene');
// elog(triangle(0, 3, 3)  , 'invalid');
// elog(triangle(3, 1, 1)  , 'invalid');












// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //================== Tri-Angles ====================//

//.............fix............
// const triangle = (...sides) => (
//   sides.some((a, _, [, b, c]) => a > 0 && (p(s) + p(a[1]) + p(a[2]) === 180))
// );



// const triangle = (...sides) => (
//   Math.min(...sides) > 0 && sides.reduce((s, n) => s + n, 0) === 180
// );

// def triangle(*angles)
//   angles = [] unless angles.all?(&:positive?) && angles.reduce(:+) == 180
//   %i[invalid right obtuse acute][angles.count { |a| a < 90 } - angles.count { |a| a == 90 }]
// end



const triangle = (a, b, c, types = ['invalid', 'right', 'obtuse', 'acute']) => (
  types[+(Math.min(a, b, c) > 0 && a + b + c === 180) &&
    [a, b, c].filter(x => x < 90).length - [a, b, c].filter(x => x === 90).length]
);


elog(triangle(60, 70, 50) , 'acute');
elog(triangle(30, 90, 60) , 'right');
elog(triangle(120, 50, 10), 'obtuse');

p()

elog(triangle(0, 90, 90)  , 'invalid');
elog(triangle(90, 90, 0)  , 'invalid');
elog(triangle(90, 45, -135)  , 'invalid');
elog(triangle(50, 50, 50) , 'invalid');















// ---------------- 4 -----------------console.log('\n--------- 4 ----------');
// //================== Unlucky Days ====================//
















// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //================== Next Featured Number Higher than a Given Value ====================//
















// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //================== Sum Square - Square Sum ====================//
















// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //================== Bubble Sort ====================//













