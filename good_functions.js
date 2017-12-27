


//=================================== eql ===================================//:

// Equality function:
//   Converts each argument to a string, then determines if they are equal.
//   This allows comparison of arrays, which can be useful for exercise test cases.

const eql = (a, b) => {
  return JSON.stringify(a) === JSON.stringify(b);
};








//================================== elog ===================================//:

// Equality-Logger: logs both objects, and returns true if equal.

const elog = (a, b) => {
  // makes output more readable if empty str:
  let aMsg = a === '' ? "''" : a;
  let bMsg = b === '' ? "''" : b;

  let result = eql(a, b);

  // logs each argument using the `p` function, with a readable notation:
  // box drawing chars:   ‖|∥∣|╽ ╾ ╿ ╲║│ ┃ ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ ╎  ╏ ╳ ✅
  if (!result) {
    p('╳   A=>   ', aMsg);
    p('╳   B=>   ', bMsg);
  } else {
    p('┊✅ A=>   ', aMsg);
  }

  // formats result in pass/fail notation:
  let msg = result ? '┊✅╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍✅✅✅✅✅╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍✅┊' : '╳_____________________________________________________________________╳';
  p(`${msg}`);

  return result;
};

//=================== elog alias ==================//

const pe = elog;

//=================================================//








//==================================== p ====================================//:

// p - combination of `console.log` and Ruby's `Kernel#p`:

const p = (...args) => {
  args.length > 0
    ? console.log(...args)  // logs 1+ comma separated arguments - ex: console.log(1, 'a', [])
    : console.log('');      // logs a blank line if no arguments.

  return args.length === 0
    ? undefined             // returns undefined if no arguments passed.
    : args.length === 1
      ? args[0]             // returns single argument's value if one argument.
      : args;               // returns all args as an array if 2+ arguments.
};




// const p = x => {
//   console.log(x);
//   return x;
// };




// // FIX: TEMPORARY p OVERRIDE...
// const p = (...args) => console.log(...args);








// //================================ shuffle =================================//:

// const shuffle = origArr => {   // https://stackoverflow.com/a/42965222
//   let arr = [...origArr];
//   let currentIdx = arr.length;

//   while (currentIdx !== 0) {
//     let randomIdx = ~~(Math.random() * currentIdx--);
//     [arr[currentIdx], arr[randomIdx]] = [arr[randomIdx], arr[currentIdx]];
//   }

//   return arr;
// };










// //================================ sample ================================//:

// const sample = arr => arr[~~(Math.random() * arr.length)];













//=============================== Test ==============================//:

// elog alias for Test.assertEquals and other Test methods in CW:
const Test = {
  assertEquals:  (a, b)    => elog(a, b),
  assertSimilar: (a, b)    => elog(a, b),
  expect:        (exp)     => p(exp),
  assertNotEquals: (a, b)  => p(!eql(a, b)),
  assertDeepEquals: (a, b) => elog(a, b),
  describe: (str, func)    => func(),
  it:       (str, func)    => {
    p('  ---> ' + str + ':');
    func();
  }
};

const it = (str, func) => {
  p('  ---> ' + str + ':');
  func();
};

const describe = (str, func) => {
  // const it = (s, f) => {
  //   p(s);
  //   f();
  // };
  func();
};








// //================================ transpose ================================//:

// // // slower version w/ map:

// // const transpose = arr => arr[0].map((_, i) => arr.map(a => a[i]));



// // faster version w/ for loop:

// const transpose = arr => {
//   let newArr   = [];
//   let innerLen = arr[0].length;
//   let outerLen = arr.length;

//   for (let i = 0, lenI = arr[0].length; i < innerLen; i++) {
//     newArr[i] = [];
//     for (let j = 0, lenJ = arr.length; j < outerLen; j++) {
//       newArr[i][j] = arr[j][i];
//     }
//   }

//   return newArr;
// };










// //================================ intersect ================================//
// // - "https://jsperf.com/array-intersection-comparison"

// // const intersect = (a, b) => {
// //   let result = [];
// //   let obj    = {};

// //   for (let i = 0, len = b.length; i < len; i++) obj[b[i]] = true;

// //   for (let i = 0, len = a.length; i < len; i++) {
// //     if (a[i] in obj) result.push(a[i]);
// //   }

// //   return result;
// // };


// const intersect = (a, b) => a.filter(Set.prototype.has, new Set(b));


// // function intersect(a, b) {
// //   const set = new Set(b);
// //   return a.filter(el => set.has(el));
// // }










// //================================ deep copy ================================//

// // recursive:

// const deepCopy = obj => {
//   if (!obj || typeof obj !== 'object') return obj;

//   if (Array.isArray(obj)) {
//     let newObj = [];
//     let len    = obj.length;
//     for (let i = 0; i < len; i++) newObj[i] = deepCopy(obj[i]);
//     return newObj;
//   }


//   let newObj = {};
//   for (let prop in obj) {
//     if (obj.hasOwnProperty(prop)) newObj[prop] = deepCopy(obj[prop]);
//   }
//   return newObj;
// };



// // non-recursive:

// function clone(obj) {
//   if (obj == null || typeof(obj) != 'object')
//     return obj;

//   var temp = new obj.constructor();
//   for (var key in obj)
//     temp[key] = clone(obj[key]);

//   return temp;
// }













// //================================ permutation ===============================//

// // "https://stackoverflow.com/questions/9960908/permutations-in-javascript"
// // // The following very efficient algorithm uses Heap's method to generate
// // // all permutations of N elements with runtime complexity in O(N!):


// const permute = function* (perm) {
//   let len = perm.length;
//   let c   = Array(len).fill(0);
//   let i   = 1;
//   let k;

//   yield perm.concat();
//   while (i < len) {
//     if (c[i] < i) {
//       k = i % 2 && c[i];
//       [perm[i], perm[k]] = [perm[k], perm[i]];
//       c[i]++;
//       i = 1;
//       yield perm.concat();
//     } else {
//       c[i] = 0;
//       i++;
//     }
//   }
// };

// Memory efficient iteration through permutations:
// for (var permutation of permute([1, 2, 3])) console.log(permutation);

// // Simple array conversion:
// var permutations = [...permute([1, 2, 3])];










// //================================ stringify ================================//

// // JSON Stringify alias:
const jstr      = str => JSON.stringify(str);
// const stringify = str => JSON.stringify(str);










// //================================ prime ================================//

// const isPrime = n => {
//   if (isNaN(n) || !isFinite(n) || n % 1 || n < 2) return false;
//   if (n % 2 === 0) return (n === 2);
//   if (n % 3 === 0) return (n === 3);

//   let sq = Math.sqrt(n);

//   for (let i = 5; i <= sq; i += 6) {
//     if (n % i === 0)       return false;
//     if (n % (i + 2) === 0) return false;
//   }

//   return true;
// };



// /*

// IDEAS:
//   - maybe log the values in elog (and/or p) in JSON format, especially for arrays, b/c it's easier to see without having to click for Chrome to load the contents.

// */





// // const gcd = (a, b) => b ? gcd(b, a % b) : a;

//   // const gcd = (x,y) => x == 0 ? y : gcd(y % x, x)
//   // const lcm = (x,y) => x * y == 0 ? 0 : x * y / gcd(x,y)










// //================================ number words ================================//
// //
// const NUMS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty', 'twenty one', 'twenty two', 'twenty three', 'twenty four', 'twenty five', 'twenty six', 'twenty seven', 'twenty eight', 'twenty nine', 'thirty', 'thirty one', 'thirty two', 'thirty three', 'thirty four', 'thirty five', 'thirty six', 'thirty seven', 'thirty eight', 'thirty nine', 'forty', 'forty one', 'forty two', 'forty three', 'forty four', 'forty five', 'forty six', 'forty seven', 'forty eight', 'forty nine', 'fifty', 'fifty one', 'fifty two', 'fifty three', 'fifty four', 'fifty five', 'fifty six', 'fifty seven', 'fifty eight', 'fifty nine', 'sixty', 'sixty one', 'sixty two', 'sixty three', 'sixty four', 'sixty five', 'sixty six', 'sixty seven', 'sixty eight', 'sixty nine', 'seventy', 'seventy one', 'seventy two', 'seventy three', 'seventy four', 'seventy five', 'seventy six', 'seventy seven', 'seventy eight', 'seventy nine', 'eighty', 'eighty one', 'eighty two', 'eighty three', 'eighty four', 'eighty five', 'eighty six', 'eighty seven', 'eighty eight', 'eighty nine', 'ninety', 'ninety one', 'ninety two', 'ninety three', 'ninety four', 'ninety five', 'ninety six', 'ninety seven', 'ninety eight', 'ninety nine'];












// //================================ flatten  ================================//

// const flatten = ([x, ...xs]) => x ? [...Array.isArray(x) ? flatten(x) : x, ...flatten(xs)] : [];












//================================ regexp escape ================================//





// const escapeRegExp = str => {
//   return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&');
// };
// const escapeRegExp = s => s.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&');






//================================ factors ================================//

// const factors = n => [...Array(~~(n / 2))].map((_, i) => ++i).filter(x => !(n % x));


// const factors = n => {
//   let inc     = n % 2 + 1;
//   let result  = [1];
//   let current = n % 2 + 2;
//   let sqrt    = Math.floor(Math.sqrt(n));

//   for (let i = inc + 1; i <= sqrt; i += inc) {
//     if (n % i !== 0) continue;
//     let j = n / i;
//     result.push(i);
//     if (j !== i) result.push(j);
//   }

//   return p(result);
// }




//======================= replace leading 0's regex =============================//


// const removeLeadingZeros = str => `${str}`.replace(/^(-?)0+(?=\d)/, '$1');





//======================= left pad =============================//

// const padZeros = (str, n) => `${'0'.repeat(n)}${str}`.slice(-n);



//============================================================================//
//======================== walk DOM tree function =========================//

function walk(node, func) {
  func(node);
  node.childNodes.forEach(child => walk(child, func));
}

