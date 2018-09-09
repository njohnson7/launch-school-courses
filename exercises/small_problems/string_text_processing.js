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



// // const wordCap = str => (
// //   str.toLowerCase().replace(/(\S)(\S*)/g, (_, m1, m2) => m1.toUpperCase() + m2)
// // );


// // const wordCap = str => (
// //   str.toLowerCase().replace(/(^| )(\S)/g, (_, m1, m2) => m1 + m2.toUpperCase())
// // );


// // const wordCap = str => (
// //   str.toLowerCase().replace(/(^| )\S/g, c => c.toUpperCase())
// // );



// const wordCap = (str, w = str.match(/\S*( |$)/)[0]) => (
//   w ? w[0].toUpperCase() + w.slice(1).toLowerCase() + wordCap(str.slice(w.length)) : ''
// );


// // const wordCap = (str, w = str.match(/\S+( |$)|$/)[0]) => (
// //   w ? w.toLowerCase().replace(/./, c => c.toUpperCase()) + wordCap(str.slice(w.length)) : ''
// // );


// // function wordCap(string) {
// //   return string.toLowerCase().replace(
// //     /(^[a-z]| [a-z])/g,
// //     function (character) {
// //       return character.toUpperCase();
// //     }
// //   );
// // }

// elog(wordCap('four score and seven')   , 'Four Score And Seven');
// elog(wordCap('the javaScript language'), 'The Javascript Language');
// elog(wordCap('this is a "quoted" word'), 'This Is A "quoted" Word');










// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============= Swap Case =============//


// // const swapcase = str => (
// //   str.replace(/./g, c => c > 'Z' ? c.toUpperCase() : c.toLowerCase())
// // );


// const swapcase = str => (
//   str.replace(/./g, c => [c.toLowerCase(), c.toUpperCase()][+(c > 'Z')])
// );



// // const swapcase = (str, c = str[0]) => (
// //   str && (/[a-z]/.test(c) ? c.toUpperCase() : c.toLowerCase()) + swapcase(str.slice(1))
// // );


// const swapcase = (str, c = str[0]) => (
//   str && (c > 'Z' ? c.toUpperCase() : c.toLowerCase()) + swapcase(str.slice(1))
// );


// // const swapcase = (str, c = str[0]) => (
// //   str && [c.toLowerCase(), c.toUpperCase()][+(c > 'Z')] + swapcase(str.slice(1))
// // );

// elog(swapcase('CamelCase')        , 'cAMELcASE');
// elog(swapcase('Tonight on XYZ-TV'), 'tONIGHT ON xyz-tv');









// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============= Staggered Caps Part 1 =============//


// // const staggeredCase = str => (
// //   str.replace(/./g, (c, i) => i % 2 ? c.toLowerCase() : c.toUpperCase())
// // );


// // const staggeredCase = str => (
// //   str.replace(/./g, (c, i) => [c.toUpperCase(), c.toLowerCase()][i % 2])
// // );



// // const staggeredCase = str => (
// //   str.replace(/.(.|$)/g, m => m[0].toUpperCase() + (m[1] || '').toLowerCase())
// // );



// // const staggeredCase = str => (
// //   str.replace(/(.)(.|$)/g, (_, a, b) => a.toUpperCase() + b.toLowerCase())
// // );



// const staggeredCase = (str, [a, b = ''] = str) => (
//   str && a.toUpperCase() + b.toLowerCase() + staggeredCase(str.slice(2))
// );




// elog(staggeredCase('I Love Launch School!')    , 'I LoVe lAuNcH ScHoOl!');
// elog(staggeredCase('ALL_CAPS')                 , 'AlL_CaPs');
// elog(staggeredCase('ignore 77 the 444 numbers'), 'IgNoRe 77 ThE 444 NuMbErS');








// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============= Staggered Caps Part 2 =============//



// const staggeredCase = (str, i = 0) => (
//   str.replace(/[a-z]/gi, c => i++ % 2 ? c.toLowerCase() : c.toUpperCase())
// );


// const staggeredCase = (str, i = 0) => (
//   str.replace(/[a-z]/gi, c => [c.toUpperCase(), c.toLowerCase()][i++ % 2])
// );




// const staggeredCase = (str, i = 0, c = str[0]) => (
//   str && (/[a-z]/i.test(c) && i++ % 2 ? c.toLowerCase() : c.toUpperCase()) + staggeredCase(str.slice(1), i)
// );



// const staggeredCase = (str, i = 0, c = str[0]) => (
//   str && (/[a-z]/i.test(c) && i++ % 2 && c.toLowerCase() || c.toUpperCase())
//     + staggeredCase(str.slice(1), i)
// );



// const staggeredCase = (str, i = 0, c = str.match(/^[a-z]/i)) => (
//   str && (c ? (i++ % 2 ? c[0].toLowerCase() : c[0].toUpperCase()) : str[0]) + staggeredCase(str.slice(1), i)
// );




// const staggeredCase = str => (
//   str.replace(/([a-z])(.*?)([a-z]|$)/gi, (_, a, b, c) =>
//     a.toUpperCase() + b + c.toLowerCase())
// );


// // BROKEN....:
// // const staggeredCase = (str, m = str.match(/[a-z].*?[a-z]|[a-z]/i)) => (
// //   str && (p(m) ? m[0] : '') + staggeredCase(str.slice(m ? m[0].length : 2))
// // );



// elog(staggeredCase('I Love Launch School!')    , 'I lOvE lAuNcH sChOoL!');
// elog(staggeredCase('ALL CAPS')                 , 'AlL cApS');
// elog(staggeredCase('ignore 77 the 444 numbers'), 'IgNoRe 77 ThE 444 nUmBeRs');

// elog(staggeredCase('ignore 77 the 444 numbersS'), 'IgNoRe 77 ThE 444 nUmBeRsS');
// elog(staggeredCase('ignore 77 the 444 numberss'), 'IgNoRe 77 ThE 444 nUmBeRsS');
// elog(staggeredCase('ignore 77 the 444 numberSs'), 'IgNoRe 77 ThE 444 nUmBeRsS');
// elog(staggeredCase('ignore 77 the 444 numbeRSs'), 'IgNoRe 77 ThE 444 nUmBeRsS');
// elog(staggeredCase('ignore 77 the 444 numbeRSs1'), 'IgNoRe 77 ThE 444 nUmBeRsS1');
// elog(staggeredCase('ignore 77 the 444 numbeRSs1z'), 'IgNoRe 77 ThE 444 nUmBeRsS1z');
// elog(staggeredCase('ignore 77 the 444 numbeRSs1za'), 'IgNoRe 77 ThE 444 nUmBeRsS1zA');
// elog(staggeredCase('ignore 77 the 444 numbeRSs12za'), 'IgNoRe 77 ThE 444 nUmBeRsS12zA');









// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============= How long are you =============//


// const wordLengths = str => (
//   (str.match(/\S+/g) || []).map(word => `${word} ${word.length}`)
// );


// const wordLengths = (str, m = str.match(/(\S+)(\s|$)/)) => (
//   str ? [`${m[1]} ${m[1].length}`, ...wordLengths(str.slice(m[0].length))] : []
// );



// elog(wordLengths('cow sheep chicken'), ['cow 3', 'sheep 5', 'chicken 7']);

// elog(wordLengths('baseball hot dogs and apple pie'),
//   ['baseball 8', 'hot 3', 'dogs 4', 'and 3', 'apple 5', 'pie 3']);

// elog(wordLengths('It ain\'t easy, is it?'), ['It 2', 'ain\'t 5', 'easy, 5', 'is 2', 'it? 3']);

// elog(wordLengths('Supercalifragilisticexpialidocious'),
//   ['Supercalifragilisticexpialidocious 34']);

// elog(wordLengths(''), []);








// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============= Search Word Part 1 =============//


// const searchWord = (word, str) => (
//   (str && word && str.match(RegExp(`\\b${word}\\b`, 'gi')) || []).length
// );



// // const searchWord = (word, str, w = str.match(/\S+/)) => (
// //   str ? (w[0].toLowerCase() === word ? 1 : 0) + searchWord(word, str.slice(w[0].length)) : 0
// // );


// // const searchWord = (word, str, w = str && str.match(/\S+/)[0].toLowerCase()) => (
// //   w ? +(w === word.toLowerCase()) + searchWord(word, str.slice(w.length)) : 0
// // );


// var text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'

// elog(searchWord('sed', text), 3);
// elog(searchWord('sEd', text), 3);
// elog(searchWord('XXXX', text), 0);
// elog(searchWord('qui', text), 4);
// elog(searchWord('QUI', text), 4);
// elog(searchWord('', text), 0);
// elog(searchWord('sed', ''), 0);
// elog(searchWord('sed'), 0);
// elog(searchWord(), 0);









// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============= Search Word Part 2 =============//




// const searchWord = (word, str) => (
//   str.replace(RegExp(`\\b${word}\\b`, 'gi'), w => `**${w.toUpperCase()}**`)
// );



const searchWord = (word, str, i = str.search(/ |$/)) => (
  str && (str.slice(0, i).toUpperCase() === word.toUpperCase()
      ? `**${word.toUpperCase()}**`
      : str.slice(0, i)) + `${str[i] || ''}` + searchWord(word, str.slice(i + 1))
);


// const searchWord = (word, str, i = str.search(/ |$/)) => {
//   if (!str) return '';
//   let upcaseWord = word.toUpperCase();
//   let replacement = str.slice(0, i).toUpperCase() === upcaseWord ? `**${upcaseWord}**` : str.slice(0, i);
//   return replacement + (str[i] || '') + searchWord(word, str.slice(i + 1));
// };





var text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'

elog(searchWord('sed', text),
'**SED** ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, **SED** quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, **SED** quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?');
elog(searchWord('qui', text),
  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos **QUI** ratione voluptatem sequi nesciunt. Neque porro quisquam est, **QUI** dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit **QUI** in ea voluptate velit esse quam nihil molestiae consequatur, vel illum **QUI** dolorem eum fugiat quo voluptas nulla pariatur?');
