/*
//======================== Practice Problems: Finding Nodes and Traversing Elements  =========================//
- double quoted strings
- function keyword spacing
- comment spacing
- `var`s to top
- `++`

___

- #5:
 - solution is not a function: "Write a JavaScript function "
 - style guide violation (array): `var keys = ["Kingdom",`
 - maybe refactor code...?
*/
//============================================================================//
//============================================================================//

// //======================== 1 =========================//

// p([...document.querySelectorAll('h2')]
//     .map(h2 => h2.textContent.split(/\s+/).length)
// );


// //======================== 2 =========================//

// p(document.querySelector('#toc'));
// p(document.querySelector('.toc'));
// p(document.querySelector('div.toc'));
// p(document.querySelectorAll('#toc')[0]);
// p(document.getElementById('toc'));
// p([...document.getElementsByTagName('div')].find(div => div.id == 'toc'));
// p(document.getElementsByClassName('toc')[0]);


// //======================== 3 =========================//

// // let toc = document.getElementById('toc');

// p(document.querySelectorAll('.toclevel-1 a').forEach((a, i) => i % 2 || (a.style.color = 'green')));



//======================== 4 =========================//

p([...document.querySelectorAll('.thumbcaption')].map(t => t.textContent.trim()));



//======================== 5 =========================//

let trs = [...document.querySelectorAll('.biota tr')]
            .filter(tr => /:$/.test(tr.firstElementChild.textContent));

let obj = trs.reduce((obj, { firstElementChild: key, lastElementChild: val }) => (
  { ...obj, [key.textContent]: val.textContent }
), {});

// let obj = trs.reduce((obj, tr) => (
//   { ...obj, [tr.firstElementChild.textContent]: tr.lastElementChild.textContent }
// ), {});

p(obj);


let obj2 =
  Object.assign(
    {},
    ...[...document.querySelectorAll('.biota tr')]
      .filter(tr => /:$/.test(tr.firstElementChild.textContent))
      .map(tr => ({ [tr.firstElementChild.textContent.slice(0, -1)]: tr.lastElementChild.textContent }))
  );

p(obj2);
