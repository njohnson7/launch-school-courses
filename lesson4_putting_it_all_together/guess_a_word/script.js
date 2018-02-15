












/*
TODO:
- change visibility hidden to display none (with veritical-align) and `toggle` instead of set `css` directly

MAYBE:
- CSS: @keyframes and `animation` property instead of transition for background color change
  - advantages over transition...?


- the word chosen for the current game
- number of incorrect guesses - this controls the number of apples we show
- all the letters guessed - the letters will show for "Guesses"
- total allowed wrong guesses - this should be 6, since we only have 6 apples!

- it needs to choose a word from the words array as the word of the game. If all words are chosen, show the "Sorry, I've run out of words!" message
- number of incorrect guesses should be initialized to 0
- the letters guessed should be initialized as an empty array
- set total allowed wrong guesses to 6
- create blanks in the "Word:" container. The number of blanks should be the same as the length of the chosen word

*/




$(function () {
  const $document = $(document);
  const $body     = $(document.body);
  const $apples   = $('.apples');
  const $word     = $('.word');
  const $guesses  = $('.guesses');
  const $gameOver = $('.game-over');

  const randomWord = (function () {
    let words = ['consider', 'minute', 'accord', 'evident', 'practice', 'intend', 'cat'];
    return _ => words.splice(~~(Math.random() * words.length), 1)[0];
  }());

  const Game = {
    MAX_WRONG_COUNT: 6,
    init() {
      this.word = randomWord();
      if (!this.word) this.outOfWords();

      this.guessedLetters = [];
      this.wrongCount     = 0;
      this.reset();
      this.addLettersToPage();
      return this;
    },
    reset() {
      $gameOver.hide();
      $body.removeClass();
      $('.letter').remove();
      $apples.show().css('backgroundPositionY', 0);
    },
    outOfWords() {
      alert('all out of words!');
      $body.hide(500);
    },
    createLetterDiv(letter) {
      return $('<div>', {
        class: 'letter',
        html:  `<span>${letter}</span>`,
      });
    },
    addLettersToPage() {
      [...this.word].forEach(letter => this.createLetterDiv(letter).appendTo($word));
    },
    isBadLetter(letter) {
      return !/^[a-z]$/.test(letter)
        || this.guessedLetters.includes(letter)
        || $gameOver.is(':visible');
    },
    addGuessedLetter(letter) {
      this.guessedLetters.push(letter);
      this.createLetterDiv(letter).appendTo($guesses);
    },
    win() {
      $gameOver.show().find('p').text('you win!');
      $body.addClass('win');
      $('a').trigger('focus');
    },
    lose() {
      $gameOver.show().find('p').text('you lose!');
      $body.addClass('lose');
      $('a').trigger('focus');
      $apples.hide();
    },
    removeApple() {
      $apples.css('backgroundPositionY', `${this.wrongCount * 20}%`);
    },
    isCorrectLetter(letter) {
      return this.word.includes(letter);
    },
    isAllCorrect() {
      return [...this.word].every(letter => this.guessedLetters.includes(letter));
    },
    showLetter(letter) {
      $word.find(`span:contains(${letter})`).show();
    },
    correct(letter) {
      this.showLetter(letter);
      if (this.isAllCorrect()) this.win();
    },
    incorrect() {
      this.wrongCount++;
      if (this.wrongCount == this.MAX_WRONG_COUNT) this.lose();
      else this.removeApple();
    },
  };

  let game;
  $('a').click(function (e) {
    e.preventDefault();
    game = Object.create(Game).init();
  }).click();

  $document.keypress(function (e) {
    let letter = e.key.toLowerCase();
    if (game.isBadLetter(letter)) return;

    game.addGuessedLetter(letter);
    if (game.isCorrectLetter(letter)) game.correct(letter);
    else game.incorrect(letter);
  });
});
