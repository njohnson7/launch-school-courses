//========================= p -- print =======================================//
const p = (...args) => {
  args.length > 0 ? console.log(...args) : console.log('');

  return args.length == 0
    ? undefined
    : args.length == 1
      ? args[0]
      : args;
};
//******************* !!!!! ******************\\
Object.defineProperty(Object.prototype, 'p', {
  get() {
    p(this.valueOf());
    return this.valueOf();
  },
});


//======================== pd -- print console.dir ===========================//
const pd = obj => {
  console.dir(obj);
  return obj;
};
//******************* !!!!! ******************\\
Object.defineProperty(Object.prototype, 'pd', {
  get() {
    pd(this);
    return this.valueOf();
  },
});


//======================= tap ================================================//
//******************** !!!!! ******************\\
Object.prototype.tap = function tap(fn = p) {
  fn(this);
  return this;
};


//============================= jstr: stringify===============================//
const jstr = JSON.stringify.bind(JSON);


//=================================== eql ====================================//
// TODO: make more robust (object methods, primitive types, etc.)
const eql = (a, b) => jstr(a) == jstr(b);


//=================================== Test ====================================//
const pe = (a, b) => {
  let aMsg = a === '' ? "''" : a;
  let bMsg = b === '' ? "''" : b;

  let result = eql(a, b);

  if (!result) {
    p('%c╳   A=>   ', 'color: #810000; border-top: .1em solid #810000', aMsg);
    p('%c╳   B=>   ', 'color: #33b5e5;', bMsg);
  } else {
    p(`%c┊✅ A=>    ${jstr(aMsg)}`, 'color: #33b5e5; font-size: .7em; border-top: .1em solid #33b5e5');
  }

  let msg   = result ? '┊✅╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍✅┊' : '╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳';
  let style = result ? 'color: #33b5e5; background: #000;' : 'color: #000; background: #810000;';
  p(`%c${msg}`, `${style} font-size: .5em;`);

  return result;
};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
const describe = (str, fn) => {
  p(`..... ${str} .....`);
  fn();
};
const it = (str, fn) => {
  p(`  ---> ${str}:`);
  fn();
};
const assertEquals = (a, b) => pe(a, b);
const Test = {
  describe,
  it,
  assertEquals,
  assertSimilar:    assertEquals,
  assertDeepEquals: assertEquals,
  expect:           (exp)  => p(exp),
  assertNotEquals:  (a, b) => p(!eql(a, b)),
};


// //========================= querySelectors ===================================//
// const qs  = document.querySelector.bind(document);
// const qsa = document.querySelectorAll.bind(document);




// //============================================================================================//
// //==================================== pp ====================================================//
// //============================================================================================//

// const PP_STYLE = 'color: #38caff; background: #000; padding: 3px;';
// const ppLine = (name, value, pad = 12) => p(`%c${name}:`.padEnd(pad), PP_STYLE, value);

// Object.defineProperty(Object.prototype, 'pp', {
//   get() {
//     for (key in this) {
//       let value = this[key];

//       if (
//         (key.startsWith('on') && !value)
//         || typeof value == 'function'
//         || value == document[key]
//         || value == window[key]
//       ) continue;

//       if (typeof value == 'string' && value.length > 100) {
//         value = { VAL: value };
//       }

//       ppLine(key, value, 20);
//     }

//     return this.valueOf();
//   },
// });
