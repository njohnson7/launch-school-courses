//======================== Traversing Nodes =========================//
/*
- function keyword spacing
- comment spacing
-----
- `[childNodes.length-1]`, `.childNodes[n+1]`, `.childNodes[n-1]`
- " takes an Array " (x2+...)
- " String "
- " Function " (x2+...)
- `  for (var i = 0; i < array.length; i++) {` (x2+...)
- parens: `recurseAndLog()` (x2+...)
- wrong syntax highlighting for multiple code snippets, such as: `> var letters = ['h', 'e', 'l', 'l', 'o'];`
- rehprase: "This output sheds some light on how recursive functions work: they do a bit of work then make the next call with a smaller version of the collection. In recurseAndLog, the argument is an Array, and each call to the function passes an Array with one less element. Each recursion logs the first character of the array then calls the function with that element removed. This process repeats until there's nothing left to do."
- newline: `}walk(document.body);  `
- in comments: `walk()` (x2+...)
*/
//============================================================================//
//============================================================================//


// const recurseAndLog = ([x, ...xs]) => x && (p(x), recurseAndLog(xs), p(1));

// recurseAndLog([...'abc']);


// var letters = ['h', 'e', 'l', 'l', 'o'];
// recurseAndLog(letters);

//========================  =========================//

function walkTree1(node) {
  let childs = node.childNodes;
  // if (!childs.length) return;
  childs.forEach(child => {
    // p(child);
    names1.push(child.nodeName);
    walkTree1(child);
  });
}

function walkTree2(node) {
  // if (!node) return;
  // p(node);
  names2.push(node.nodeName);
  node.childNodes.forEach(walkTree2);
}

let names1 = [document.nodeName];
let names2 = [];

// walkTree1(document);
// walkTree2(document);

// p(names1);
// p(names2);
// elog(names1, names2);

//========================  =========================//

// function walkTree(node = document) {
//   p(node.nodeName);
//   node.childNodes.forEach(walkTree);
// }

// walkTree();
// p();

//========================  =========================//


function walk(node, func) {
  func(node);
  node.childNodes.forEach(child => walk(child, func));
}

walk(document.body, node => p(node.nodeName));


walk(document, node => p(node.toString()));
