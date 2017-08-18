// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============= Uppercase Check =============//


// // const isUppercase = str => str === str.toUpperCase();


// const isUppercase = str => !/[a-z]/.test(str);



// const isUppercase = str => (
//   ![...str].map(c => c.charCodeAt(0)).some(n => n > 96 && n < 123)
// );



// p(eql(isUppercase('t'),          false));
// p(eql(isUppercase('T'),          true));
// p(eql(isUppercase('Four Score'), false));
// p(eql(isUppercase('FOUR SCORE'), true));
// p(eql(isUppercase('4SCORE!'),    true));
// p(eql(isUppercase(''),           true));










// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============= Delete Vowels =============//



// // const removeVowels = arr => (
// //   arr.map(str => str.replace(/[aeiou]/gi, '') )
// // );


// // const removeVowels = arr => (
// //   arr.join('\n').replace(/[aeiou]/gi, '').split('\n')
// // );


// const removeVowels = (arr, str = arr[0]) => (
//   str ? [str.replace(/[aeiou]/gi, ''), ...removeVowels(arr.slice(1))] : []
// );


// elog(removeVowels(['abcdefghijklmnopqrstuvwxyz']),        ['bcdfghjklmnpqrstvwxyz']);
// elog(removeVowels(['green', 'YELLOW', 'black', 'white']), ['grn', 'YLLW', 'blck', 'wht']);
// elog(removeVowels(['ABC', 'AEIOU', 'XYZ']),               ['BC', '', 'XYZ']);










// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============= Lettercase Counter =============//


// // const letterCaseCount = str => ({
// //   lowercase: str.replace(/[^a-z]/g, '').length,
// //   uppercase: str.replace(/[^A-Z]/g, '').length,
// //   neither:   str.replace(/[a-z]/gi, '').length,
// // });


// // const letterCaseCount = str => (
// //   [['lowercase', /[^a-z]/g], ['uppercase', /[^A-Z]/g], ['neither', /[a-z]/gi]]
// //     .reduce((counts, [type, pattern]) =>
// //       (counts[type] = str.replace(pattern, '').length, counts), {})
// // );


// const letterCaseCount = str => (
//   [['lowercase', /[^a-z]/g], ['uppercase', /[^A-Z]/g], ['neither', /[a-z]/gi]]
//     .reduce((counts, [type, pattern]) =>
//       ({ ...counts, ...{ [type]: str.replace(pattern, '').length } }), {})
// );


// elog(letterCaseCount('abCdef 123'), { lowercase: 5, uppercase: 1, neither: 4 });
// elog(letterCaseCount('AbCd +Ef'),   { lowercase: 3, uppercase: 3, neither: 2 });
// elog(letterCaseCount('123'),        { lowercase: 0, uppercase: 0, neither: 3 });
// elog(letterCaseCount(''),           { lowercase: 0, uppercase: 0, neither: 0 });











// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============= Capitalize Words =============//



// const wordCap = str => (
//   str.toLowerCase().replace(/(\S)(\S*)/g, (_, m1, m2) => `${m1.toUpperCase()}${m2}`)
// );


const wordCap = str => (
  str.toLowerCase().replace(/(\S)(\S*)/g, (_, m1, m2) => `${m1.toUpperCase()}${m2}`)
);

elog(wordCap('four score and seven')   , 'Four Score And Seven');
elog(wordCap('the javaScript language'), 'The Javascript Language');
elog(wordCap('this is a "quoted" word'), 'This Is A "quoted" Word');










// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============= Swap Case =============//
















// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============= Staggered Caps Part 1 =============//
















// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============= Staggered Caps Part 2 =============//
















// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============= How long are you =============//
















// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============= Search Word Part 1 =============//
















// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============= Search Word Part 2 =============//











