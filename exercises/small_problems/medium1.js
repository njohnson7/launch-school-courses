// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============= Rotation Part 1 ============//



// // const rotateArray = arr => (
// //   Array.isArray(arr) && [...arr.slice(1), ...arr.slice(0, 1)] || void 0
// // );


// // const rotateArray = arr => (
// //   Array.isArray(arr) ? [...arr.slice(1), ...arr.slice(0, 1)] : undefined
// // );


// // const rotateArray = arr => (
// //   Array.isArray(arr) ? [...arr.slice(1), ...arr.slice(0, 1)] : undefined
// // );


// // const rotateArray = (arr, [a, ...b] = Array.isArray(arr) ? arr : 'ab') => (
// // const rotateArray = (arr, [a, ...b] = Array.isArray(arr) ? arr : []) => (


// // const rotateArray = (arr, [a, ...b] = Array.isArray(arr) ? arr[0] ? arr : [[]] : [undefined, []]) => (
// // // const rotateArray = (arr, [a, ...b] = Array.isArray(arr) ? arr : [] )=> (
// //   // p('a -->', a, 'b --->', b, 'c --->', [].concat(a, ...b), [...b, a])[5]
// //   // a ? b : a

// //   // p(a) && [].concat(...b, a)
// //   p(a) && [].concat(b, a)
// //   // p(a, b)[0] && [...b, a]


// //   // a && [].concat(a, ...b)
// //   // p(a) ? [...b, a] : b.length && b[0]
// //   // a && b ? [...b, a] : a === 'XX' ? b[0] : a
// // );




// const rotateArray = (arr, nope = Array.isArray(arr) || undefined) => (
//   nope && [...arr.slice(1), ...arr.slice(0, 1)]
// );



// elog(rotateArray([7, 3, 5, 2, 9, 1]),  [3, 5, 2, 9, 1, 7]);
// elog(rotateArray(['a', 'b', 'c']),     ['b', 'c', 'a']);
// elog(rotateArray(['a']),               ['a']);
// elog(rotateArray([1, 'a', 3, 'c']),    [ 'a', 3, 'c', 1 ]);
// elog(rotateArray([{a: 2}, [1, 2], 3]), [ [1, 2], 3, {a: 2} ]);
// p()

// elog(rotateArray([]),                  []);

// // return undefined if the argument is not an array
// elog(rotateArray(),                    undefined);
// elog(rotateArray(1),                   undefined);
// p();

// // the input array is not mutated
// x = [1, 2, 3, 4]
// elog(rotateArray(x),                   [2, 3, 4, 1]);
// elog(x,                                [1, 2, 3, 4]);






// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============= Rotation Part 2 ============//



// const rotateRightmostDigits = (num, n) => (
//   +[...`${num}`.slice(0, -n), ...rotateArray([...`${num}`.slice(-n)])].join('')
// );


// const rotateRightmostDigits = (num, n, [_, a, b] = String(num).match(RegExp(`(.*)(.{${n}})`))) => (
//   +[p(a), ...p(rotateArray([...b]))].join('')
// );


// const rotateRightmostDigits = (num, n) => (
//   +`${num}`.replace(RegExp(`(.*)(.{${n}})`), (_, a, b) => a + rotateArray([...b]).join(''))
// );


// const rotateRightmostDigits = (num, n, regex = RegExp(`(.*)(.{${n}})`)) => (
//   +`${num}`.replace(regex, (_, a, b) => a + rotateArray([...b]).join(''))
// );


// const rotateRightmostDigits = (num, n) => (
//   +(`${num}`.slice(0, -n) + rotateArray([...`${num}`.slice(-n)]).join(''))
// );



// const rotateRightmostDigits = (num, n, [a, b] = [`${num}`.slice(0, -n), `${num}`.slice(-n)]) => (
//   +(a + rotateArray([...b]).join(''))
// );


// const rotateRightmostDigits = (num, n, [a, b] = [[0, -n], [-n]].map(i => `${num}`.slice(...i))) => (
//   +(a + rotateArray([...b]).join(''))
// );



// const rotateRightmostDigits = (num, n, [a, b] = [~~(num / 10**n) * 10**n, (num % 10**n)]) => (
//   // p(a, b)
//   // p(num % 10**n * 10 + ~~(num % 10**n / 10000))
//   // p(a, b, b % 10**(n - 1) * 10 + ~~(b / 10**(n - 1)))
//   p(a + b % 10**(n - 1) * 10 + ~~(b / 10**(n - 1)))
// );


// const rotateRightmostDigits = (num, n) => (
//   p(~~(num / 10**n)) * p(10**n) + p(num % 10**--n) * 10 + p(~~(num / 10**n % 10))
// );


// const rotateRightmostDigits = (num, n) => (
//   ~~(num / 10**n) * 10**n + num % 10**--n * 10 + ~~(num / 10**n % 10)
// );



// const rotateRightmostDigits = (num, n) => (
//   // p(String(num).slice(0, -n), String(num).substr(-n + 1, n - 1), String(num).substr(-n, 1))
//   +(String(num).slice(0, -n) + String(num).substr(-n + 1, n - 1) + String(num).substr(-n, 1))
// );


// const rotateRightmostDigits = (num, n, numStr = ''+num) => (
//   +(numStr.slice(0, -n--) + numStr.substr(-n, n) + numStr.substr(-++n, 1))
// );


// const rotateRightmostDigits = (num, n) => (
//   +(`${num}`.slice(0, -n--) + `${num}`.substr(-n, n) + `${num}`.substr(-++n, 1))
// );



// const rotateRightmostDigits = (num, n) => (
//   +`${num}`.replace(RegExp(`(.{${`${num}`.length - n}})(.)(.*)`), '$1$3$2')
// );



// //left:  slice(0, n)
// //right: slice(6 - n)

// // [1,2,3,4,5,6].map(x => [~~(n / 10**x), n % 10**x])
// let n = 735291;


// elog(rotateRightmostDigits(735291, 1), 735291);
// p()
// elog(rotateRightmostDigits(735291, 2), 735219);
// p()
// elog(rotateRightmostDigits(735291, 3), 735912);
// p()
// elog(rotateRightmostDigits(735291, 4), 732915);
// p()
// elog(rotateRightmostDigits(735291, 5), 752913);
// p()
// elog(rotateRightmostDigits(735291, 6), 352917);
// p()










// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// ==== Rotation Part 3 ============//



// // If you take a number like
// // 735291. and rotate it to the left, you get
// // 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get
// // 329175. Keep the first 2 digits fixed in place and rotate again to get
// // 321759. Keep the first 3 digits fixed in place and rotate again to get
// // 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get
// // 321579. The resulting number is called the maximum rotation of the original number.



// const rotateRightmostDigits = (num, n, numStr = `${num}`) => {
//   let left = numStr.slice(0, numStr.length - n);
//   let right = numStr.slice(numStr.length - n);
//   return +(left + right.slice(1) + right[0]);
// };



// const maxRotation = (num, n = `${num}`.length) => (
//   n ? maxRotation(rotateRightmostDigits(num, n), --n) : num
// );




// elog(maxRotation(735291)    , 321579);
// p()

// elog(maxRotation(3)         , 3);
// p()

// elog(maxRotation(35)        , 53);
// p()

// elog(maxRotation(105)       , 15 ); // # the leading zero gets dropped
// p()

// elog(maxRotation(8703529146), 7321609845);
// p()







// // elog(rotateRightmostDigits1(735291, -1)    , rotateRightmostDigits3(735291, -1));
// // p()

// // elog(rotateRightmostDigits1(3, -1)         , rotateRightmostDigits3(3, -1));
// // p()

// // elog(rotateRightmostDigits1(35, -1)        , rotateRightmostDigits3(35, -1));
// // p()

// // elog(rotateRightmostDigits1(105, -1)       , rotateRightmostDigits3(105, -1) ); // # the leading zero gets dropped
// // p()

// // elog(rotateRightmostDigits1(8703529146, -1), rotateRightmostDigits3(8703529146, -1));
// // p()










// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============= Stack Machine Interpretation ============//



// // // const minilang = str => {
// // //   let commands = str.match(/\S+/g)
// // //   let register = 0;
// // //   let stack = [];

// // //   // p(commands);

// // //   while (commands.length > 0) {
// // //     cmd = commands.shift();
// // //     // p(cmd)
// // //     if (/\d/.test(cmd)) register = +cmd;
// // //     else if (cmd === 'PUSH') stack.push(register);
// // //     else if (cmd === 'POP') register = stack.pop();
// // //     else if (cmd === 'PRINT') console.log(register);
// // //     else if (cmd === 'ADD') register += stack.pop();
// // //     else if (cmd === 'SUB') register -= stack.pop();
// // //     else if (cmd === 'MULT') register *= stack.pop();
// // //     else if (cmd === 'DIV') register /= stack.pop();
// // //     else if (cmd === 'MOD') register %= stack.pop();

// // //     register = ~~register;

// // //     // p(' cmd:       %s\n register:  %s\n stack:     %s\n------', cmd, register, JSON.stringify(stack))
// // //     // p(stack);
// // //   }
// // //   // p('~~~~~~~~~~FINAL~~~~~~~')
// // //   // p(' cmd:       %s\n register:  %s\n stack:     %s\n------', cmd, register, JSON.stringify(stack))

// // // };



// // // const minilang = str => {
// // //   let commands = str.match(/\S+/g)
// // //   let register = 0;
// // //   let stack = [];

// // //   commands.reduce((reg, cmd) => {
// // //     if (/\d/.test(cmd)) reg = +cmd;
// // //     else if (cmd === 'PUSH') stack.push(+reg);
// // //     else if (cmd === 'POP') reg = +(stack.pop());
// // //     else if (cmd === 'PRINT') console.log(reg);
// // //     else if (cmd === 'ADD') reg += +stack.pop();
// // //     else if (cmd === 'SUB') reg -= stack.pop();
// // //     else if (cmd === 'MULT') reg *= stack.pop();
// // //     else if (cmd === 'DIV') reg /= stack.pop();
// // //     else if (cmd === 'MOD') reg %= stack.pop();

// // //     // p('reg at end: %s,  |  ~~reg: %s', reg, ~~reg)

// // //     return ~~reg;
// // //   }, 0);
// // // };


// // // const COMMANDS = { POP: '', ADD: '+', SUB: '-', MULT: '*', DIV: '/', MOD: '%' };


// // // const minilang = (str, stack = []) => {
// // //   str.match(/\S+/g).reduce((reg, cmd) => {
// // //     if      (/\d/.test(cmd))  reg = +cmd;
// // //     else if (cmd === 'PRINT') console.log(reg);
// // //     else if (cmd === 'PUSH')  stack.push(reg);
// // //     else                      eval(`reg ${COMMANDS[cmd]} stack.pop()`);
// // //     return ~~reg;
// // //   }, 0);
// // // };


// // // const minilang = (str, stack = [], reg = 0, cmd = (str.match(/\S+/) || [])[0]) => {
// // //   if (!cmd) return;

// // //   if      (/\d/.test(cmd))  reg = w+cmd;
// // //   else if (cmd === 'PRINT') console.log(reg);
// // //   else if (cmd === 'PUSH')  stack.push(reg);
// // //   else                      eval(`reg ${CwOMMANDS[cmd]} stack.pop()`);

// // //   // p('******\n', ++cmd.length, '  str-B4>>  ', `"${str}"`, '  str-AFTER>>  ', `"${str.slice(cmd.length + 1)}"`, '\n~~~~~~~~\n\n');

// // //   return minilang(str.slice(cmd.length + 1), stack, ~~reg);
// // // };




// const COMMANDS = { POP: '', ADD: '+', SUB: '-', MULT: '*', DIV: '/', MOD: '%' };

// const minilang = (str, stack = [], reg = 0, cmd = (str.match(/\S+/) || [])[0]) => {
//   if      (!cmd)               return;
//   else if (/\d/.test(cmd))     reg = +cmd;
//   else if (cmd === 'PRINT')    console.log(reg);
//   else if (cmd === 'PUSH')     stack.push(reg);
//   else if (!(cmd in COMMANDS)) throw `InvalidTokenError: ${cmd} is not a token`;
//   else if (!stack.length)      throw 'EmptyStackError';
//   else                         eval(`reg ${COMMANDS[cmd]}= stack.pop()`);

//   return minilang(str.slice(++cmd.length), stack, ~~reg);
// };





// // minilang('PRINT 5 ADD 1 SUB 2 POP 1');
// // p('==================================================')
// // // // 0


// // minilang('PRINT 5 PUSH 6 ADD STAMP');
// // p('==================================================')
// // // 0



// minilang('PRINT');
// p('==================================================')
// // 0

// minilang('5 PUSH 3 MULT PRINT');
// p('==================================================')
// // 15

// minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// p('==================================================')
// // 5
// // 3
// // 8

// minilang('5 PUSH POP PRINT');
// p('==================================================')
// // 5

// minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// p('==================================================')
// // 5
// // 10
// // 4
// // 7

// minilang('3 PUSH PUSH 7 DIV MULT PRINT ');
// p('==================================================')
// // 6

// minilang('4 PUSH PUSH 7 MOD MULT PRINT ');
// p('==================================================')
// // 12

// minilang('-3 PUSH 5 SUB PRINT');
// p('==================================================')
// // 8

// minilang('6 PUSH');
// p('==================================================')
// // (nothing printed; no PRINT commands)


// // minilang('6 PRINT 3 PRINT 4 ADD PRINT 3 PRINT PRINT');
// // p('==================================================')








// ---------------- 5 -----------------console.log('\n--------- 5 ----------');
// //============= Word to Digit ============//

// const NUMS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
// const wordToDigit = s => s.replace(RegExp(NUMS.join('|'), 'g'), w => NUMS.indexOf(w));





// const NUMS = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 };


// // const wordToDigit = (str, m = p(str.match(/([a-z]+)([^a-z]+|$)/i))) => (
// //   m ? (NUMS[(m[1])] || m[1]) + m[2] + wordToDigit(p(str.slice(m[0].length))) : str
// // );


// const wordToDigit = (str, m = str.match(/([a-z]+)([^a-z]+)/i)) => (
//   m ? (NUMS[m[1]] || m[1]) + m[2] + wordToDigit(str.slice(m[0].length)) : ''
// );


// elog(wordToDigit('Please call me at five five five one two three four. Thanks.'),
// 'Please call me at 5 5 5 1 2 3 4. Thanks.');













// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============= Fibonacci Numbers (Recursion) ============//



// // const fibonacci = (n, a = 1, b = 1) => n <= 1 ? a : fibonacci(n - 1, b, a + b);



// // const fibonacci = (n, a = 1, b = 1) => --n ? fibonacci(n, b, a + b) : a;



// // const fibonacci = n => (
// //   n < 3 ? 1 : fibonacci(n - 2) + fibonacci(n - 1)d
// // );



// // const fibonacci = n => n < 3 ? 1 : fibonacci(n - 2) + fibonacci(n - 1);




// // const fibonacci = n => --n < 2 ? 1 : fibonacci(n - 1) + fibonacci(n);



// const fibonacci = n => --n < 2 ? 1 : fibonacci(n) + fibonacci(--n);






// elog(fibonacci(1) , 1);  // 1, 1, 2, 3, 5, 8, 13, 21, 34
// elog(fibonacci(2) , 1);
// elog(fibonacci(3) , 2);
// elog(fibonacci(4) , 3);
// elog(fibonacci(5) , 5);
// elog(fibonacci(12), 144);
// elog(fibonacci(20), 6765);








// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============= Fibonacci Numbers (Procedural) ============//


// const fibonacci = n => (
//   [...Array(n - 2)].reduce(([a, b], _) => [b, a + b], [1, 1])[1]
// );



// fibGenerator = function*() {
//   let [a, b] = [1, 1]
//   while (true) {
//     yield a;
//     [a, b] = [b, a + b];
//   }
// };

// const fibonacci = (n, fib = fibGenerator()) => (
//   [...Array(++n).keys()].reduce(_ => fib.next()).value
// );



// elog(fibonacci(20) , 6765);
// elog(fibonacci(50) , 12586269025);
// elog(fibonacci(100), 354224848179261915075);

// p(fibonacci(10000));
// p(fibonacci(10000) > Number.MAX_VALUE);








// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============= Fibonacci Numbers (Memoization) ============//




// const fibonacci = (n, a = 1, b = 1) => n <= 1 ? a : fibonacci(n - 1, b, a + b);



// const fibonacci = (n, a = 1, b = 1) => --n ? fibonacci(n, b, a + b) : a;




// const fibonacci = (n, fibs = [1, 1]) => {
//   if (n <= fibs.length) return fibs[0];
//   return fibonacci(n, [fibs[0] + fibs[1], ...fibs]);
// };


// const fibonacci = (n, fibs = [1, 1]) => (
//   n <= fibs.length ? fibs[0] : fibonacci(n, [fibs[0] + fibs[1], ...fibs])
// );



// const fibonacci = (n, memo = {}) => {
//   if (n < 3) return 1;
//   if (memo[n]) {
//     return memo[n];
//   } else {
//     memo[n] = fibonacci(n - 1) + fibonacci(n - 2);
//   }
//   return memo[n];
// };



// const fibonacci = (n, memo = {}) => {
//   if (n < 3) return 1;
//   return memo[n] || (memo[n] = fibonacci(n - 1) + fibonacci(n - 2));
// };




// const fibonacci = (n, memo = {}) => (
//   n < 3 ? 1 : memo[n] ||
//     (memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo))
// );




const fibonacci = (n, memo = {}) => (
  n < 3 ? 1 : memo[n] || (memo[n] = fibonacci(--n, memo) + fibonacci(--n, memo))
);



// const fibonacci = ((n, memo = {}) => fib = n => (
//   n < 3 ? 1 : memo[n] || (memo[n] = fib(--n) + fib(--n))
// ))();



const fibonacci = ((n, memo = [1, 1, 1]) => fib = n => (
  memo[n] || (memo[n] = fib(--n) + fib(--n))
))();






elog(fibonacci(1) , 1);      // 1, 1, 2, 3, 5, 8, 13, 21, 34
elog(fibonacci(2) , 1);
elog(fibonacci(3) , 2);
elog(fibonacci(4) , 3);
elog(fibonacci(5) , 5);
elog(fibonacci(12), 144);
elog(fibonacci(20), 6765);
