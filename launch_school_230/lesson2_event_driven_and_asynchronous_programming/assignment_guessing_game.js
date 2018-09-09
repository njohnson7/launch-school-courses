/*
- computer picks a random integer between 1 and 100
- player enters guessed number and submits it
  - count number of guesses
- program checks whether guess is higher, lower, or equal and reports result
  - ex: "My number is lower than 50"
- player continues to play until number is guessed
  - display success message
    - ex: "You guessed it! It took you 4 guesses."
- new game reset link
*/
//================================== Tests ===================================//

// let testArr = [...Array(100000)].map(_ => randomNum()).sort((a, b) => a - b);
// p(testArr[0]);
// p(testArr[testArr.length - 1]);

//============================================================================//


document.addEventListener('DOMContentLoaded', function () {
  function reset() {
    count           = 0;
    guess           = 0;
    num             = randomNum();
    par.innerText   = 'Guess a number from 1 to 100';
    input.value     = '';
    input.disabled  = false;
    submit.disabled = false;
    input.focus();
  }

  const randomNum = _ => ~~(Math.random() * 100 + 1);

  let par    = document.querySelector('p');
  let input  = document.getElementById('guess');
  let submit = document.querySelector("input[type='submit']");
  let a      = document.querySelector('a');

  submit.addEventListener('click', function (event) {
    event.preventDefault();
    guess = ~~parseInt(input.value);
    if (guess <= 0 || guess > 100) {
      par.innerText = 'Please enter a number between 1 and 100';
      return;
    }

    input.value = '';
    count++;
    if (num < guess) {
      par.innerText = `My number is lower than ${guess}`;
    } else if (num > guess) {
      par.innerText = `My number is higher than ${guess}`;
    } else {
      par.innerText   = `You guessed it! It took you ${count} guesses.`;
      input.value     = guess;
      input.disabled  = true;
      submit.disabled = true;
    }
  });

  a.addEventListener('click', function (event) {
    event.preventDefault();
    reset();
  });

  let count;
  let num  ;
  let guess;

  reset();
});
