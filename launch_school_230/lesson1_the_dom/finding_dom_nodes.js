//======================== Finding DOM Nodes =========================//
/*
- "Element", "Array", "Function", "Object", "Number"
- missing semicolons
- function keyword spacing
- double quoted strings
- parens around function/method names in text
- wrap `NodeList` and `HTMLCollection` in backticks
- comment spacing
- backticks in comments
- "‚Äö√Ñ¬∂"
-----
- " but we more often want "
- " if your structure "
- " of [just] one."
- " the p Elements in this [the] DOM "
- `var i`, `++i`, `i++`, `var p`, `p++` (x2+...)
- "class" is not necessarily related to CSS: " CSS class " (x2+...)
- clarify if built-in method: "Use getElementsByTagName "
- some array-like objects support `forEach`: "Like other Array-like Objects, they do not support forEach or other Array methods. "
- ", but not all browsers; "
- " provides no support "
- " then use the higher-order Array functions."
- `paragraphs[0];;`
- backticks/quotes/rephrase: `// The following will fail with "forEach" undefined in some browsers`
- " to use the document.getElementsByTagName [method]"
- " let's restrict to those "
- add info that `querySelector` methods can also be called on elements
- solutions only match `p`s in `intro`s not `div.intro`s
*/
//============================================================================//
//============================================================================//

//======================== 1.1 =========================//

// function getPs(node) {
//   return node.querySelectorAll('p');
// }

// function getPs(node) {
//   let ps = [];
//   walk(node, nd => nd.tagName == 'P' && ps.push(nd));
//   return ps;
// }

// function getPs(node) {
//   return node.getElementsByTagName('p');
// }

// function getPs(node, ps = []) {
//   if (node.tagName == 'P') ps.push(node);
//   node.childNodes.forEach(nd => getPs(nd, ps));
//   return ps;
// }

// p(getPs(document));



//======================== 1.2 =========================//

// function addClass(node = document.body, tag = 'p', klass = 'article-text') {
//   node.querySelectorAll(tag).forEach(nd => nd.classList.add(klass));
// }

// addClass();
// addClass(document, 'div', 'crazy-div-omg');


//======================== 1.3 =========================//


// // function getElementsByTagName(name) {
// //   function getElems(node) {
// //     if (node.tagName == name.toUpperCase()) elems.push(node);
// //     node.childNodes.forEach(nd => getElems(nd));
// //   }

// //   let elems = [];
// //   getElems(document.body);
// //   return elems;
// // }

// function wok(node, fn) {
//   fn(node);
//   node.childNodes.forEach(nd => wok(nd, fn));
// }

// function getElementsByTagName(tagName) {
//   let elems = [];
//   wok(document.body, node => node.tagName == tagName.toUpperCase() && elems.push(node));
//   return elems;
// }

// function addClassNameToElems(elems, className) {
//   elems.forEach(elem => elem.classList.add(className));
// }

// let ps = getElementsByTagName('p');
// p(ps.map(pe => pe.className));
// addClassNameToElems(ps, 'article-text');
// p(ps.map(pe => pe.className));





//============================================================================//
//============================================================================//

//======================== 2.1 =========================//


// function addClassNameToElems(elems, className) {
//   elems.forEach(elem => elem.classList.add(className));
// }

// let ps = [...document.getElementsByTagName('p')];
// p(ps.map(pe => pe.className));
// addClassNameToElems(ps, 'article-text');
// p(ps.map(pe => pe.className));


//======================== 2.2 =========================//


// let introDivs = [...document.getElementsByClassName('intro')];
// let introPars = [].concat(...introDivs.map(div => [...div.getElementsByTagName('p')]));
// p(introPars);
// introPars.forEach(par => par.classList.add('article-text'));
// p(introPars);


document.querySelectorAll('div.intro p').forEach(par => par.classList.add('article-text'));
