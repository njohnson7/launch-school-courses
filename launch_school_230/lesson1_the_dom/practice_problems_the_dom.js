/*
//======================== Practice Problems: the DOM  =========================//
- quotes around class names...?
- function keyword spacing
- `var`s top
- comment spacing

- snake case: "primary_heading"
- " click on that like "
- " use getAttribute access "
- " on it points "
*/
//============================================================================//
//============================================================================//

//======================== 1 =========================//

document.querySelector('h1').classList.add('heading');

document.getElementById('primary_heading').setAttribute('class', 'heading');


//======================== 2 =========================//

document.getElementById('list').classList.add('bulleted');

document.getElementById('list').className = 'bulleted';


//======================== 3 =========================//

document.querySelector('a').onclick = function (e) {
  e.preventDefault();
  let notice = document.getElementById('notice');
  notice.className = notice.className == 'hidden' ? 'visible' : 'hidden';
};


//======================== 4 =========================//

document.getElementById('notice').onclick = function (e) {
  // e.preventDefault();
  this.className = 'hidden';
};


//======================== 5 =========================//

document.getElementById('multiplication').innerText = 13 * 9;


//======================== 6 =========================//

document.body.id = 'styled';
