//========================= p -- print =======================================//
const p = (...args) => {
  args.length > 0 ? console.log(...args) : console.log('');

  return args.length == 0
    ? undefined
    : args.length == 1
      ? args[0]
      : args;
};
//********************** !!!!!!!!! **********************\\
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
//********************** !!!!!!!!! **********************\\
Object.defineProperty(Object.prototype, 'pd', {
  get() {
    pd(this);
    return this.valueOf();
  },
});



// /*==================================== pn newline =======================================*/
// //********************** !!!!!!!!! **********************\\
Object.defineProperty(window, 'pn', {
  get() {
    p();
    return 'pn'
  },
});



//============================= jstr: stringify===============================//
const jstr = JSON.stringify.bind(JSON);
const jpar = JSON.parse.bind(JSON);
const pj   = obj => p(jpar(jstr(obj)))
//********************** !!!!!!!!! **********************\\
Object.defineProperty(Object.prototype, 'pj', {
  get() {
    return pj(this.valueOf());
  },
});



/*======================== pa =========================*/
const pa = (...args) => {
  args.forEach(arg => p(arg))
  return args
}


/*======================== pt =========================*/
const pt = obj => {
  console.table(obj)
  return obj
}
//********************** !!!!!!!!! **********************\\
Object.defineProperty(Object.prototype, 'pt', {
  get() {
    pt(this);
    return this.valueOf();
  },
});



//========================= querySelectors ========================================//
const qs  = (selector, parent = document) => parent.querySelector(selector);
const qsa = (selector, parent = document) => [...parent.querySelectorAll(selector)];
/*=================================================================================*/



/*=========================================================================================*/
/*=========================================================================================*/
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
/*=========================================================================================*/
