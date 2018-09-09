// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============ Reverse a String ===========//

// function reverse(str) {
//   return str.split('').reverse().join('');
// }

// function reverse(str) {
//   return str.replace(/./g, (c, i) => str[str.length - i - 1]);
// }

// console.log(reverse('hello'));               // returns "olleh"
// console.log(reverse('The quick brown fox')); // returns "xof nworb kciuq ehT"

// console.log(reverse('hello')                === "olleh");
// console.log(reverse('The quick brown fox')  === "xof nworb kciuq ehT");







// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============ Acronym  ===========//

// function acronym(str) {
//   return str.split(/[\s-]/).map(w => w[0].toUpperCase()).join('');
// }

// function acronym(str) {
//   return str.replace(/[^\s-]+[\s-]?/g, w => w[0].toUpperCase());
// }

// console.log(acronym('Portable Network Graphics'));                 // "PNG"
// console.log(acronym('First In, First Out'));                       // "FIFO"
// console.log(acronym('PHP: HyperText Preprocessor'));               // "PHP"
// console.log(acronym('Complementary metal-oxide semiconductor'));   // "CMOS"
// console.log(acronym('Hyper-text Markup Language'));                // "HTML"


// console.log(acronym('Portable Network Graphics')               === "PNG");
// console.log(acronym('First In, First Out')                     === "FIFO");
// console.log(acronym('PHP: HyperText Preprocessor')             === "PHP");
// console.log(acronym('Complementary metal-oxide semiconductor') === "CMOS");
// console.log(acronym('Hyper-text Markup Language')              === "HTML");





// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============ Email Validation ===========//

/*
  - rules:
    - must be 1 @ char
    - local part:  only 1+ letters [a-zA-Z] and/or digits
    - domain part: 2+ components separated by a single dot
      - component: 1+ letters [a-zA-Z]
*/
// function isValidEmail(email) {
//   return /^[a-z\d]+@([a-z]+\.)+[a-z]+$/i.test(email);
// }

// console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
// console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
// console.log(isValidEmail('foo@baz.com'));             // returns true
// console.log(isValidEmail('foo@baz.ph'));              // returns true
// console.log(isValidEmail('HELLO123@baz'));            // returns false
// console.log(isValidEmail('foo.bar@baz.to'));          // returns false
// console.log(isValidEmail('foo@baz.'));                // returns false
// console.log(isValidEmail('foo_bat@baz'));             // returns false
// console.log(isValidEmail('foo@bar.a12'));             // returns false
// console.log(isValidEmail('foo_bar@baz.com'));         // returns false
// console.log(isValidEmail('foo@bar.....com'));         // returns false

// console.log('=======');

// console.log(isValidEmail('Foo@baz.com.ph')    === true);
// console.log(isValidEmail('Foo@mx.baz.com.ph') === true);
// console.log(isValidEmail('foo@baz.com')       === true);
// console.log(isValidEmail('foo@baz.ph')        === true);
// console.log(isValidEmail('HELLO123@baz')      === false);
// console.log(isValidEmail('foo.bar@baz.to')    === false);
// console.log(isValidEmail('foo@baz.')          === false);
// console.log(isValidEmail('foo_bat@baz')       === false);
// console.log(isValidEmail('foo@bar.a12')       === false);
// console.log(isValidEmail('foo_bar@baz.com')   === false);
// console.log(isValidEmail('foo@bar.....com')   === false);





// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============ Matching Parentheses ===========//

// function isBalanced(str) {
//   str = str.replace(/[^()]/g, '');
//   while (/\(\)/.test(str)) str = str.replace(/\(\)/, '');
//   return str.length === 0;
// }

// console.log(isBalanced('What (is) this?'));        // true
// console.log(isBalanced('What is) this?'));         // false
// console.log(isBalanced('What (is this?'));         // false
// console.log(isBalanced('((What) (is this))?'));    // true
// console.log(isBalanced('((What)) (is this))?'));   // false
// console.log(isBalanced('Hey!'));                   // true
// console.log(isBalanced(')Hey!('));                 // false
// console.log(isBalanced('What ((is))) up('));       // false

// console.log('=======');

// console.log(isBalanced('What (is) this?')      === true);
// console.log(isBalanced('What is) this?')       === false);
// console.log(isBalanced('What (is this?')       === false);
// console.log(isBalanced('((What) (is this))?')  === true);
// console.log(isBalanced('((What)) (is this))?') === false);
// console.log(isBalanced('Hey!')                 === true);
// console.log(isBalanced(')Hey!(')               === false);
// console.log(isBalanced('What ((is))) up(')     === false);







// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============ Sentiment Analysis 1 ===========//

// var textExcerpt = 'To be or not to be-that is the question:\n' +
//   'Whether \'tis nobler in the mind to suffer\n' +
//   'The slings and arrows of outrageous fortune,\n' +
//   'Or to take arms against a sea of troubles,\n' +
//   'And, by opposing, end them. To die, to sleep-\n' +
//   'No more-and by a sleep to say we end\n' +
//   'The heartache and the thousand natural shocks\n' +
//   'That flesh is heir to-\'tis a consummation\n' +
//   'Devoutly to be wished. To die, to sleep-\n' +
//   'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
//   'For in that sleep of death what dreams may come,\n' +
//   'When we have shuffled off this mortal coil,\n' +
//   'Must give us pause. There\'s the respect\n' +
//   'That makes calamity of so long life.\n' +
//   'For who would bear the whips and scorns of time,\n' +
//   'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
//   'The pangs of despised love, the law’s delay, [F: disprized]\n' +
//   'The insolence of office, and the spurns\n' +
//   'That patient merit of the unworthy takes,\n' +
//   'When he himself might his quietus make\n' +
//   'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
//   'To grunt and sweat under a weary life,\n' +
//   'But that the dread of something after death,\n' +
//   'The undiscovered country from whose bourn\n' +
//   'No traveler returns, puzzles the will\n' +
//   'And makes us rather bear those ills we have\n' +
//   'Than fly to others that we know not of?\n' +
//   'Thus conscience does make cowards of us all,\n' +
//   'And thus the native hue of resolution\n' +
//   'Is sicklied o\'er with the pale cast of thought,\n' +
//   'And enterprises of great pitch and moment, [F: pith]\n' +
//   'With this regard their currents turn awry, [F: away]\n' +
//   'And lose the name of action.-Soft you now,\n' +
//   'The fair Ophelia.-Nymph, in thy orisons\n' +
//   'Be all my sins remembered';

// var positiveWords = ['fortune', 'dream', 'love', 'respect', 'patience', 'devout', 'noble', 'resolution'];
// var negativeWords = ['die', 'heartache', 'death', 'despise', 'scorn', 'weary', 'trouble', 'oppress'];

// function sentiment(text) {
//   let words = text.toLowerCase().match(/\b\w+\b/g);
//   let neg = words.filter(w => negativeWords.includes(w));
//   let pos = words.filter(w => positiveWords.includes(w));
//   let sentimentScore = pos.length - neg.length;
//   let sentiment = 'Neutral';

//   if      (sentimentScore > 0) sentiment = 'Positive';
//   else if (sentimentScore < 0) sentiment = 'Negative';

//   console.log(`There are ${pos.length} positive words in the text.`);
//   console.log(`Positive sentiments: ${pos.join(', ')}\n\n`);
//   console.log(`There are ${neg.length} negative words in the text.`);
//   console.log(`Negative sentiments: ${neg.join(', ')}\n\n`);
//   console.log(`The sentiment of the text is ${sentiment}.`);
// }

// sentiment(textExcerpt);

// // // console output

// // There are 5 positive words in the text.
// // Positive sentiments: fortune, dream, respect, love, resolution

// // There are 6 negative words in the text.
// // Negative sentiments: die, heartache, die, death, weary, death

// // The sentiment of the text is Negative.







// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============ Sentiment Analysis 2 ===========//

// var textExcerpt = 'To be or not to be-that is the question:\n' +
//   'Whether \'tis nobler in the mind to suffer\n' +
//   'The slings and arrows of outrageous fortune,\n' +
//   'Or to take arms against a sea of troubles,\n' +
//   'And, by opposing, end them. To die, to sleep-\n' +
//   'No more-and by a sleep to say we end\n' +
//   'The heartache and the thousand natural shocks\n' +
//   'That flesh is heir to-\'tis a consummation\n' +
//   'Devoutly to be wished. To die, to sleep-\n' +
//   'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
//   'For in that sleep of death what dreams may come,\n' +
//   'When we have shuffled off this mortal coil,\n' +
//   'Must give us pause. There\'s the respect\n' +
//   'That makes calamity of so long life.\n' +
//   'For who would bear the whips and scorns of time,\n' +
//   'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
//   'The pangs of despised love, the law’s delay, [F: disprized]\n' +
//   'The insolence of office, and the spurns\n' +
//   'That patient merit of the unworthy takes,\n' +
//   'When he himself might his quietus make\n' +
//   'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
//   'To grunt and sweat under a weary life,\n' +
//   'But that the dread of something after death,\n' +
//   'The undiscovered country from whose bourn\n' +
//   'No traveler returns, puzzles the will\n' +
//   'And makes us rather bear those ills we have\n' +
//   'Than fly to others that we know not of?\n' +
//   'Thus conscience does make cowards of us all,\n' +
//   'And thus the native hue of resolution\n' +
//   'Is sicklied o\'er with the pale cast of thought,\n' +
//   'And enterprises of great pitch and moment, [F: pith]\n' +
//   'With this regard their currents turn awry, [F: away]\n' +
//   'And lose the name of action.-Soft you now,\n' +
//   'The fair Ophelia.-Nymph, in thy orisons\n' +
//   'Be all my sins remembered';

// var positiveRegex = /(fortunes?)|(dream(s|t|ed)?)|(love(s|d)?)|(respect(s|ed)?)|(patien(ce|t)?)|(devout(ly)?)|(nobler?)|(resolut(e|ion)?)/gi;
// var negativeRegex = /(die(s|d)?)|(heartached?)|(death)|(despise(s|d)?)|(scorn(s|ed)?)|(weary)|(troubles?)|(oppress(es|ed|or('s)?)?)/gi;

// function sentiment(text) {
//   let neg = text.match(negativeRegex).map(w => w.toLowerCase());
//   let pos = text.match(positiveRegex).map(w => w.toLowerCase());
//   let sentimentScore = pos.length - neg.length;
//   let sentiment = 'Neutral';

//   if      (sentimentScore > 0) sentiment = 'Positive';
//   else if (sentimentScore < 0) sentiment = 'Negative';

//   console.log(`There are ${pos.length} positive words in the text.`);
//   console.log(`Positive sentiments: ${pos.join(', ')}\n\n`);
//   console.log(`There are ${neg.length} negative words in the text.`);
//   console.log(`Negative sentiments: ${neg.join(', ')}\n\n`);
//   console.log(`The sentiment of the text is ${sentiment}.`);
// }

// sentiment(textExcerpt);

// // console output

// // There are 9 positive type words in the text.
// // Positive sentiments: nobler, fortune, devoutly, dream, dreams, respect, love, patient, resolution

// // There are 10 negative type words in the text.
// // Negative sentiments: troubles, die, heartache, die, death, scorns, oppressor's, despised, weary, death

// // The sentiment of the text is Negative.





// /*---------------- 11 -----------------*/console.log('\n--------- 10 --------');
// //============ Mail Count ===========//

/*
  - input: emailData => String containing email messages
    - contains multiple messages, separated by delimiter: '##||##'
    - each message:
      - has 5 parts in sequence:
        - sender
        - subject
        - date
        - recipient
        - body
      - each part is separated by delimiter: '#/#'

  - output: log 2 strings to console =>
    - number of email messages found in emailData
      - ex: 'Count of Email: 5'
    - date range of the messages
      - ex: 'Date Range: Sat Jun 25 2016 - Thu Aug 11 2016'
*/


function mailCount(emailData) {
  let dates = emailData
    .match(/(#\/#\n)(Date.+?)\1/g)
    .map(m => new Date(m.match(/(Date: )(.{10})/)[2]))
    .sort((a, b) => Number(a) - Number(b))
    .map(dateObj => String(dateObj).slice(0, 15));

  console.log(`Count of Email: ${dates.length}`);
  console.log(`Date Range: ${dates[0]} - ${dates.slice(-1)}`);
}

mailCount(emailData);

// console.output
// Count of Email: 5
// Date Range: Sat Jun 25 2016 - Thu Aug 11 2016
