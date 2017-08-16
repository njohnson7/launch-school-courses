// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============= Double Char Part 1 ============//



// // const repeater = str => str.replace(/(.)/g, '$1$1');



// // const repeater = str => str.replace(/./g, c => `${c}${c}`);


// // const repeater = str => str.replace(/./g, c => c + c);



// const repeater = str => str.replace(/./g, '$&$&');



// // const repeater = str => str ? str[0] + str[0] + repeater(str.slice(1)) : '';



// // const repeater = str => str ? str[0].repeat(2) + repeater(str.slice(1)) : '';




// console.log(repeater('Hello'));     // "HHeelllloo"
// console.log(repeater('Good job!')); // "GGoooodd  jjoobb!!"
// console.log(repeater(''));          // ''

// console.log('----');

// console.log(repeater('Hello')     === "HHeelllloo");
// console.log(repeater('Good job!') === "GGoooodd  jjoobb!!");
// console.log(repeater('')          === '');











// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============= Double Char Part 2 ============//


// const doubleConsonants = s => s.replace(/(?![eiou])[b-z]/gi, '$&$&');

// console.log(doubleConsonants('String'));       // "SSttrrinngg"
// console.log(doubleConsonants('Hello-World!')); // "HHellllo-WWorrlldd!"
// console.log(doubleConsonants('July 4th'));     // "JJullyy 4tthh"
// console.log(doubleConsonants(''));             // ""

// console.log('======');

// console.log(doubleConsonants('String')       === "SSttrrinngg");
// console.log(doubleConsonants('Hello-World!') === "HHellllo-WWorrlldd!");
// console.log(doubleConsonants('July 4th')     === "JJullyy 4tthh");
// console.log(doubleConsonants('')             === "");








// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============= Convert number to reversed array of digits ============//


// // returns a string... FIX:
// // const reversedNumber = num => num === 0 ? '' : reversedNumber(+String(num).slice(1)) + String(num)[0];

// // NO GOOD.... FIXED BELOW:
// // const rrreversedNumber = n => n === 0 ? 0 : (n % 10) * Math.floor(10**Math.log10(n)) + (Math.floor(reversedNumber(n / 10)));


// // // WORKS:
// // const reversedNumber = (n, x = 0) => {
// //   if (n === 0) {
// //     return x;
// //   } else {
// //     // let rem10 = Math.floor(n % 10);
// //     let rem = (n % 10);
// //     let log = Math.floor(10**Math.log10(n));
// //     let div = Math.floor(n / 10);

// //     // console.log('rem', rem, 'log', log, 'div', div, 'mult', rem * log, 'x', x);
// //     // return rem * log + reversedNumber(div);
// //     // debugger;
// //     // return rem + x * 10 + reversedNumber(div, rem + x * 10);
// //     return reversedNumber(div, rem + x * 10);
// //   }
// // };


// // const reversedNumber = n => +[...`${n}`].reverse().join('');



// // const reversedNumber = n => (
// //   +`${n}`.replace(/./g, (_, i, s) => s.substr(-++i, 1))
// // );



// const reversedNumber = (n, result = 0) => (
//   n ? reversedNumber(~~(n / 10), n % 10 + result * 10) : result
// );


// // const reversedNumber = n => (
// //   n && n % 10 * 10**~~Math.log10(n) + reversedNumber(~~(n / 10))
// // );



// console.log(reversedNumber(12345)); // 54321
// console.log(reversedNumber(12213)); // 31221
// console.log(reversedNumber(456));   // 654
// console.log(reversedNumber(12000)); // 21 # Note that zeros get dropped!
// console.log(reversedNumber(1));     // 1

// console.log('======');

// console.log(reversedNumber(12345) === 54321);
// console.log(reversedNumber(12213) === 31221);
// console.log(reversedNumber(456)   === 654);
// console.log(reversedNumber(12000) === 21 );
// console.log(reversedNumber(1)     === 1);







// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============= Get The Middle Character ============//


// // const centerOf = str => {
// //   let half = str.length / 2;
// //   let i = Math.ceil(half - 1);
// //   let j = ~~half + 1;

// //   let k = ~~(str.length / 2 -.1)

// //   var index = Math.floor((str.length - 1) / 2);

// // console.log(index, i, k);
// //   // console.log(half, '   ', '[i]:', i, '|', str[i], '[j]:', j, str[j]);
// //   return str.slice(i, j);
// // };




// // const centerOf = (str, i = str.length / 2) => (
// //   str.slice(Math.ceil(i - 1), ~~i + 1)
// // );




// // const centerOf = (s, i = s.length / 2) => s.slice(0|i-.1, ~~i + 1)



// // const centerOf = (s, i = s.length / 2) => s.slice(i-.1>>0, ~~i + 1)



// const centerOf = (s, i = s.length / 2) => s.slice(~~(i - .1), ~~i + 1);





// console.log(centerOf('I love ruby'));    // 'e'
// console.log(centerOf('Launch School'));  // ' '
// console.log(centerOf('Launch'));         // 'un'
// console.log(centerOf('Launchschool'));   // 'hs'
// console.log(centerOf('x'));              // 'x'

// console.log(centerOf('I love ruby')   === 'e');
// console.log(centerOf('Launch School') === ' ');
// console.log(centerOf('Launch')        === 'un');
// console.log(centerOf('Launchschool')  === 'hs');
// console.log(centerOf('x')             === 'x');










// ---------------- 5 -----------------console.log('\n--------- 5 ----------');
// //============= Always Return Negative ============//

// // const negative = n => -Math.abs(n);



// const negative = n => -Math.sign(n) * n;


// // const negative = n => n <= 0 && n || -n;



// // const negative = n => n < 0 ? n : -n;


// console.log(negative(5));  // -5
// console.log(negative(-3)); // -3
// console.log(negative(0));  // -0
// console.log(negative(-0));  // -0








// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============= Counting Up ============//


// // const sequence = n => Array.from({length: n}, (_, i) => ++i);

// // const sequence = n => Array.from(Array(++n).keys()).slice(1);

// // const sequence = n => Array(n).fill().map((_, i) => ++i);



// // keys:
// const sequence = n => [...Array(++n).keys()].slice(1);

// // from
// const sequence = n => Array.from(Array(n), (_, i) => ++i);

// // map:
// const sequence = n => [...Array(n)].map((_, i) => ++i);

// // repeat:
// const sequence = n => [...'n'.repeat(n)].map((_, i) => ++i);

// // generator:
// const sequence = n => [...function* (i = 1) { while (i <= n) yield(i++) }()];





// console.log(sequence(5)); // [1, 2, 3, 4, 5]
// console.log(sequence(3)); // [1, 2, 3]
// console.log(sequence(1)); // [1]










// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============= Name Swapping ============//


// // const swapName = name => name.split(' ').reverse().join(', ');


// // const swapName = name => name.replace(/(.+) (.+)/, '$2, $1');


// // const swapName = (name, [a, b] = name.split(' ')) => [b, a].join(', ')




// // const swapName = name => name.replace(/(.+) (.+)/, (_, a, b) => `${b}, ${a}`);


// // const swapName = name => name.split(' ').reduce((a, b) => `${b}, ${a}`);


// // const swapName = (name, [a, b] = name.match(/\S+/g)) => [b, a].join(', ');



// // // FE:

// // const swapName = name => name.replace(/(.+) (.+$)/, '$2, $1');





// console.log(swapName('Joe Roberts')); // 'Roberts, Joe'
// // console.log(swapName('Joe Fred Roberts')); // 'Roberts, Joe Fred'







// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============= Sequence Count ============//



// const sequence = (n, gap) => Array(n).fill().map((_, i) => gap * ++i);




// const sequence = (n, gap) => n ? [...sequence(n - 1, gap), gap * n] : [];




// const sequence = (n, gap) => [...Array(n)].map((_, i) => gap * ++i);



// const sequence = (n, gap) => [...Array(n).keys()].map(i => gap * ++i);




// const sequence = (n, gap) => Array(n).fill(gap).map(g => (gap += g) - g);






// console.log(sequence(5, 1));       // [1, 2, 3, 4, 5]
// console.log(sequence(4, -7));      // [-7, -14, -21, -28]
// console.log(sequence(3, 0));       // [0, 0, 0]
// console.log(sequence(0, 1000000)); // []









// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============= Reverse It Part 1 ============//


// // const reverseSentence = str => str.split(' ').reverse().join(' ');




// const reverseSentence = str => (
//   str.split(/( )/).reduceRight((result, w) => result + w, '')
// );


// const reverseSentence = (str, words = str.split(/( )/)) => (
//   `${words}` && reverseSentence(str, words.slice(1)) + words[0]
// );


// console.log(reverseSentence(''));                     // ''
// console.log(reverseSentence('Hello World'));          // 'World Hello'
// console.log(reverseSentence('Reverse these words'));  // 'words these Reverse'


// console.log(reverseSentence('')                    === '');
// console.log(reverseSentence('Hello World')         === 'World Hello');
// console.log(reverseSentence('Reverse these words') === 'words these Reverse');








// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============= Reverse It Part 2 ============//



const reverseWords = str => (
  str.replace(/\S{5,}/g, word => [...word].reverse().join(''))
);


console.log(reverseWords('Professional'));          // lanoisseforP
console.log(reverseWords('Walk around the block')); // Walk dnuora the kcolb
console.log(reverseWords('Launch School'));         // hcnuaL loohcS


console.log(reverseWords('Professional')          === 'lanoisseforP');
console.log(reverseWords('Walk around the block') === 'Walk dnuora the kcolb');
console.log(reverseWords('Launch School')         === 'hcnuaL loohcS');
