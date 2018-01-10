document.addEventListener('DOMContentLoaded', function () {
  let textField = document.querySelector('.text-field');
  let content   = document.querySelector('.content');

  let intervalID = null;
  textField.onclick = function (event) {
    event.stopPropagation();
    textField.classList.add('focused');
    intervalID = intervalID || setInterval(function () {
      textField.classList.toggle('cursor');
    }, 500);
  };

  document.onclick = function () {
    clearInterval(intervalID);
    intervalID = null;
    textField.classList.remove('focused');
    textField.classList.remove('cursor');
  };

  document.addEventListener('keydown', function (event) {
    if (textField.classList.contains('focused')) {
      if (event.key.length == 1)    content.innerText += event.key;
      if (event.key == 'Backspace') content.innerText = content.innerText.slice(0, -1);
      // if (event.key == 'Enter') {
        // let br = document.createElement('br');
        // content.appendChild(br);
      // }
    }
  });
});
