//============================= jstr: stringify===============================//

const jstr = str => JSON.stringify(str);



//=================================== eql ===================================//:

// TODO: make more robust
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
    p('%c╳   A=>   ', 'color: #810000; border-top: .1em solid #810000', aMsg);
    p('%c╳   B=>   ', 'color: #33b5e5;', bMsg);
  } else {
    p(`%c┊✅ A=>    ${jstr(aMsg)}`, 'color: #33b5e5; font-size: .7em; border-top: .1em solid #33b5e5');
  }

  // formats result in pass/fail notation:
  let msg   = result ? '┊✅╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍✅┊' : '╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳';
  let style = result ? 'color: #33b5e5; background: #000;' : 'color: #000; background: #810000;';
  p(`%c${msg}`, `${style} font-size: .5em;`);

  return result;
};
//=================== elog alias ==================//
const pe = elog;



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



//=============================== Test ==============================//:

const describe = (str, fn) => {
  p(`..... ${str} .....`);
  fn();
};
const it = (str, fn) => {
  p(`  ---> ${str}:`);
  fn();
};
const assertEquals = (a, b) => elog(a, b);
const Test = {
  describe,
  it,
  assertEquals,
  assertSimilar:    assertEquals,
  assertDeepEquals: assertEquals,
  expect:           (exp)  => p(exp),
  assertNotEquals:  (a, b) => p(!eql(a, b)),
};






//============================================================================//
//======================== DOM manipulation =========================//

const qs  = document.querySelector.bind(document);
const qsa = document.querySelectorAll.bind(document);



//===================================================================================================//
//================================== Object.prototype overrides =====================================//
//===================================================================================================//
//======================== console.dir and console.table aliases (and more) =========================//

const pd = obj => {
  console.dir(obj);
  return obj;
};

const pt = obj => {
  console.table(obj);
  return obj;
};

//========================================================================================//
//=================================== guard clause =======================================//
// if (qsa('meta').some(meta => meta.dataset.allowObjectPrototypeOverride)) {
//   // ex: `<meta charset='utf-8' data-allow-object-prototype-override>`
//========================================================================================//

const PP_STYLE = 'color: #38caff; background: #000; padding: 3px;';
const ppLine = (name, value, pad = 12) => p(`%c${name}:`.padEnd(pad), PP_STYLE, value);


//............................................................................//



//............................................................................//




//======================== p -- print =========================//
if ('p' in Object.prototype) {
  p("WARNING: property 'p' already exists in Object.prototype -- skipping");
  alert("WARNING: property 'p' already exists in Object.prototype -- skipping");
} else {
  Object.defineProperty(Object.prototype, 'p', {
    get() {
      p(this.valueOf());
      return this.valueOf();
    },
  });
}


//======================== pd -- print console.dir =========================//
if ('pd' in Object.prototype) {
  p("WARNING: property 'pd' already exists in Object.prototype -- skipping");
  alert("WARNING: property 'pd' already exists in Object.prototype -- skipping");
} else {
  Object.defineProperty(Object.prototype, 'pd', {
    get() {
      pd(this);
      return this.valueOf();
    },
  });
}


// //======================== pt -- print table =========================//
// if ('pt' in Object.prototype) {
//   p("WARNING: property 'pt' already exists in Object.prototype -- skipping");
//   alert("WARNING: property 'pt' already exists in Object.prototype -- skipping");
// } else {
//   Object.defineProperty(Object.prototype, 'pt', {
//     get() {
//       pt(this);
//       return this.valueOf();
//     },
//   });
// }


//............................................................................//



//............................................................................//




// //======================== pp -- pretty print =========================//
// if ('pp' in Object.prototype) {
//   p("WARNING: property 'pp' already exists in Object.prototype -- skipping");
//   alert("WARNING: property 'pp' already exists in Object.prototype -- skipping");
// } else {
//   Object.defineProperty(Object.prototype, 'pp', {
//     get() {
//       // TODO: fix for primitives
//       for (key in this) {
//         let value = this[key];
//         if (key.startsWith('on') || typeof value == 'function' || value == document[key] || value == window[key]) continue;
//         ppLine(key, value, 25);
//       }
//       return this.valueOf();
//     },
//   });
// }

// //======================== pm -- print methods =========================//
// if ('pm' in Object.prototype) {
//   p("WARNING: property 'pm' already exists in Object.prototype -- skipping");
//   alert("WARNING: property 'pm' already exists in Object.prototype -- skipping");
// } else {
//   Object.defineProperty(Object.prototype, 'pm', {
//     get() {
//       for (key in this) {
//         let method = this[key];
//         if (typeof method != 'function') continue;
//         ppLine(key, method, 25);
//       }
//       return this.valueOf();
//     },
//   });
// }

//======================== tap =========================//
Object.prototype.tap = function tap(fn = p) {
  fn(this);
  return this;
};

//======================== log XHR info =========================//
const pReq = e => (e.target
  .tap(req => ppLine('request', req))
  .tap(req => ppLine('status', `${req.status} -- ${req.statusText}`))
  .tap(req => ppLine('response', req.response))
);

//======================== create and send an XHR =========================//
const makeRequest = function ({
  url,
  method       = 'GET',
  headers      = {},
  data         = null,
  handlers     = { loadend: pReq },
  responseType = 'text',
} = {}, loadendFn) {
  if (url == null) return p('must include url');
  let xhr = new XMLHttpRequest;
  xhr.open(method, url);
  // TODO: change `fn` to an array of functions
  Object.entries(handlers).forEach(([event, fn]) => xhr.addEventListener(event, fn));
  Object.entries(headers).forEach(header => xhr.setRequestHeader(...header));
  if (typeof loadendFn == 'function') xhr.addEventListener('loadend', loadendFn);
  xhr.responseType = responseType;
  xhr.send(data);
  return xhr;
};




//======================================================================================//
//======================================== OLD =========================================//
//======================================================================================//

// //=================================================//
// // add 'pj' to Object.prototype:
// if ('pj' in Object.prototype) {
//   p("WARNING: property 'pj' already exists in Object.prototype -- skipping");
//   alert("WARNING: property 'pj' already exists in Object.prototype -- skipping");
// } else {
//   Object.defineProperty(Object.prototype, 'pj', {
//     get() {
//       p(jstr(this));
//       return this.valueOf();
//     },
//   });
// }

// //=================================================//
// // add 'pv' to Object.prototype:
// if ('pv' in Object.prototype) {
//   p("WARNING: property 'pv' already exists in Object.prototype -- skipping");
//   alert("WARNING: property 'pv' already exists in Object.prototype -- skipping");
// } else {
//   Object.defineProperty(Object.prototype, 'pv', {
//     get() {
//       p(this.valueOf());
//       return this.valueOf();
//     },
//   });
// }




//======================================================================================//
//================================== MAYBE ADD THESE ===================================//
//======================================================================================//

//======================== form field utility functions =========================//

// const getFields   = form => [...form.elements].filter(elem => elem.nodeName != 'BUTTON');
// const fieldsToObj = fields => fields.reduce((obj, { name, value })=> ({ ...obj, [name]: value }), {});
// const fieldsToUrl = fields => (
//   fields.map(({ name, value }) => [name, value].map(encodeURIComponent).join('=')).join('&')
// );

// const toUrlEncoded = obj => (
//   Object.entries(obj)
//     .reduce((str, { name, value }) => str += `${encodeURIComponent(name)}=${encodeURIComponent(value)}`, '')
// );

//============================================================================//
