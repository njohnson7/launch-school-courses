








const p  = val => (console.log(val), val);
const pd = val => (console.dir(val), val);
Object.defineProperty(Object.prototype, 'p', {
  get() {
    p(this.valueOf());
    return this.valueOf();
  },
});

//============================================================================//



document.addEventListener('DOMContentLoaded', function () {
  const getMatches = function (query, callback) {
    let req = new XMLHttpRequest;
    req.open('GET', `/countries?matching=${query}`);
    req.responseType = 'json';
    req.onload = function () {
      callback(this.response);
    };
    req.send();
  };

  const renderLi = function (name, id) {
    let li       = document.createElement('li');
    li.innerHTML = name;
    li.id        = id;
    li.className = 'autocomplete-ui-choice';
    ul.appendChild(li);
  };

  const clear = elem => (elem.innerHTML = '');

  // const VALID_KEYS = /^[a-zÅ '(),.-]$/i;
  const app        = document.querySelector('.app');
  const input      = app.querySelector('input');
  const ul         = app.querySelector('ul');
  const overlay    = app.querySelector('.autocomplete-overlay');

  input.oninput = function (e) {
    // if (!VALID_KEYS.test(e.key)) return e.key.p;
    clear(ul);
    clear(overlay);

    let query = this.value;
    getMatches(query, function (matches) {
      matches.forEach(({ name, id }, i) => {
        renderLi(name, id);
        if (i == 0) overlay.innerHTML = query + name.slice(query.length);
      });
    });
  };

  input.onkeydown = function (e) {
    p(e.key);

    let firstLi  = ul.firstElementChild;
    let selected = ul.querySelector('.selected');

    if (e.key == 'Tab' && firstLi) {
      e.preventDefault();
      this.value = (selected || firstLi).innerText;
      clear(ul);
      clear(overlay);
    } else if (e.key == 'Enter') {
      if (selected) this.value = selected.innerText;
      clear(ul);
      clear(overlay);
    } else if ((e.key == 'ArrowDown' || e.key == 'ArrowUp') && firstLi) {
      e.preventDefault();
      if (!selected) {
        let target = e.key == 'ArrowDown' ? firstLi : ul.lastElementChild;
        target.classList.add('selected');
      } else {
        let lis = [...ul.children];
        let idx = lis.indexOf(selected);
        selected.classList.remove('selected');
        idx += e.key == 'ArrowDown' ? 1 : -1;
        idx %= lis.length;
        if (idx < 0) idx += lis.length;
        lis[idx].classList.add('selected');
      }

      selected = ul.querySelector('.selected');
      clear(overlay);
      this.value = selected.innerText;
    }
  };
});



// RegExp([...new Set([...c.map(x => x.name).join('')])].sort().join(''));
