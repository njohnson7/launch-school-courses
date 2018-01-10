/*
//======================== The Event Object =========================//
- function keyword spacing
- double quoted strings
- change (some?) "ie"s to "eg"s
- periods ending sentences in tables
- "Number", "String", (maybe more...)
- the `which` property is deprecated
- `String` instead of `toString`
- codepen is buggy -- changes to JS code are not always reflected on page -- worked fine after copy pasting to Chrome

- " here are some available "
- use of template literals without explanation
- wrong indentation: `tbody.appendChild(tr);`
- missing semicolon: `document.body.scrollTop = document.body.scrollHeight`
- " red X moves "
*/
//============================================================================//
//============================================================================//

//======================== 1 =========================//

// document.addEventListener('DOMContentLoaded', function () {
//   document.addEventListener('click', function (event) {
//     let x        = document.querySelector('.x');
//     x.style.top  = `${event.clientY}px`;
//     x.style.left = `${event.clientX}px`;
//   });
// });



//======================== 2 =========================//

// document.addEventListener('DOMContentLoaded', function () {
//   document.addEventListener('mousemove', function (event) {
//     let x        = document.querySelector('.x');
//     x.style.top  = `${event.clientY}px`;
//     x.style.left = `${event.clientX}px`;
//   });
// });



//======================== 3 =========================//

// document.addEventListener('keypress', function (event) {
//   let xH = document.querySelector('.horizontal');
//   let xV = document.querySelector('.vertical');
//   if (event.key == 'b') {
//     xH.style.backgroundColor = 'blue';
//     xV.style.backgroundColor = 'blue';
//   } else if (event.key == 'r') {
//     xH.style.backgroundColor = 'red';
//     xV.style.backgroundColor = 'red';
//   } else if (event.key == 'g') {
//     xH.style.backgroundColor = 'green';
//     xV.style.backgroundColor = 'green';
//   }
// });


// document.addEventListener('keypress', function (event) {
//     let xs    = [...document.querySelector('.x').children];
//     let color = { r: 'red', g: 'green', b: 'blue' }[event.key] || xs[0].style.background;
//     xs.forEach(x = > x.style.background = color);
// });


//======================== 4 =========================//

// document.addEventListener('DOMContentLoaded', function () {
//   // - bottom: "N characters remaining"
//   //   - start from 140, down to -N...
//   //   - turn all text red when N > 140

//   let textArea = document.querySelector('textarea');
//   let par      = document.querySelector('.counter');

//   textArea.addEventListener('keyup', function (event) {
//     let count            = 140 - textArea.value.length;
//     par.innerText        = `${count} characters remaining`;
//     textArea.style.color = count < 0 ? 'red' : 'black';
//   });
// });


// document.addEventListener('DOMContentLoaded', function () {
//   let textarea = document.querySelector('textarea');
//   let par      = document.querySelector('.counter');
//   let button   = document.querySelector('button');

//   textarea.addEventListener('keyup', function (event) {
//     let count     = 140 - textarea.value.length;
//     par.innerText = `${count} characters remaining`;
//     if (count < 0) {
//       textarea.classList.add('invalid');
//       button.disabled = true;
//     } else {
//       textarea.classList.remove('invalid');
//       button.removeAttribute('disabled');
//     }
//   });
// });



document.addEventListener('DOMContentLoaded', function () {
  let textarea = document.querySelector('textarea');
  let par      = document.querySelector('.counter');
  let button   = document.querySelector('button');

  textarea.addEventListener('keyup', function (event) {
    let count     = 140 - textarea.value.length;
    let invalid   = count < 0;
    par.innerText = `${count} characters remaining`;
    textarea.classList.toggle('invalid', invalid);
    button.disabled = invalid;
  });
});
