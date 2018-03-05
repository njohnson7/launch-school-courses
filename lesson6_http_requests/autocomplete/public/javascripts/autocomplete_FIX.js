








const p  = val => (console.log(val), val);
const pd = val => (console.dir(val), val);
Object.defineProperty(Object.prototype, 'p', {
  get() {
    p(this.valueOf());
    return this.valueOf();
  },
});
//============================================================================//


const getMatches = function (query) {
  let matches;
  let req = new XMLHttpRequest;
  req.open('GET', `/countries?matching=${query}`);
  req.responseType = 'json';
  req.onload = function () {
    matches = this.response;
    query.p;
    matches.p;
  };
  req.send();

  return matches;
};

document.addEventListener('DOMContentLoaded', function () {
  const VALID_KEYS = /^[a-zÅ '(),.-]|Tab$/i;
  const input = document.querySelector('input');

  input.onkeyup = function (e) {
    if (!VALID_KEYS.test(e.key)) return e.key.p;

    let query = this.value;
    // query.p
    // e.p
    let matches = getMatches(query);
    matches.p;

  };
});



// RegExp([...new Set([...c.map(x => x.name).join('')])].sort().join(''));
