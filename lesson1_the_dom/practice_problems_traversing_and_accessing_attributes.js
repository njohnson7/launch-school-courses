//======================== Practice Problems: Traversing and Accessing Attributes  =========================//
/*
- inconsistent use of closing `/` in self closing tags in HTML between this page and previous pages
- comment spacing
- double quoted strings
- function keyword spacing

___

- "Function"
- `  for (var i = 0; i < node.childNodes.length; i++)`
- doesn't work for element nodes: "You can use the data property to retrieve the textual content of a node. "
- #5:
  - missing semicolon
  - change to `img` instead of `i`
  - change `match` to `test`
*/
//============================================================================//


// //======================== 1 =========================//

// p(document.lastChild.lastChild.childNodes[1].style.color    = 'red');
// p(document.lastChild.lastChild.childNodes[1].style.fontSize = '48px');


// //======================== 2 =========================//

// let nodes = [];
// walk(document.body, node => nodes.push(node));
// let paragraphs = nodes.filter(node => node.nodeName == 'P');
// // p(paragraphs.forEach(para => p(para.textContent)));
// p(paragraphs.length);


// //======================== 3 =========================//

// let firstWords = paragraphs.map(para => para.textContent.match(/\w+/)[0]);
// // let firstWords = paragraphs.map(para => para.firstChild.data.trim().split(' ')[0]);
// p(firstWords);


// //======================== 4 =========================//

// paragraphs.slice(1).forEach(para => para.classList.add('stanza'));




//======================== 5 =========================//

let images = [];
walk(document.body, node => node.tagName == 'IMG' && images.push(node));
p(images.length);
p(images.filter(img => /png$/.test(img.src)).length);


//======================== 6 =========================//

walk(document.body, node => node.tagName == 'A' && (node.style.color = 'red'));
